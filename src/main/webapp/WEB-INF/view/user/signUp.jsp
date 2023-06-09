<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css' rel='stylesheet'/>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'/>
<link href='https://getbootstrap.com/docs/5.3/assets/css/docs.css' rel='stylesheet'/>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<link href='../res/style.css' rel='stylesheet'/>
<script src='../res/navigation.js'></script>
<script src='../res/modal.js'></script>
<title>signUp</title>
<script>
$(() => {
	let regexr = null
	
	let idCheck = false
	
	$('#userId').change(() => {
		idCheck = false
	})
	
	
	$('#duplicateCheck').click(() => {
		if($('#userId').val().length > 4) {
			regexr = /[a-z0-9]{5}/
	    	$.ajax({
				url: 'getUserDto',
				data: {
					userId: $('#userId').val()
				},
				dataType: 'json',
				success: user => {
					if(user.length) {
						showOkModal('아이디가 중복되었습니다.')
						idCheck = false
					} else {
						showOkModal('사용가능한 아이디입니다.')
						idCheck = regexr.test($('#userId').val())
					}
				}
			})
		} else {
			showOkModal('영문, 숫자로 구성된 5자리 이상의 아이디를 입력하세요.')
		}
    })
	
    
    let passwordCheck = false
    
    $('input').keyup(function () {
    	regexr = /[a-z0-9]{6}/
        let pwMsg = $('#pwMsg')
        if (($('#userPw').val() !== $('#userPwCheck').val()) &&
        		($('#userPw').val() && $('#userPwCheck').val())) {
            pwMsg.removeClass('text-success-emphasis')
            pwMsg.addClass('text-danger-emphasis')
            pwMsg.text('비밀번호가 일치하지 않습니다.')
            passwordCheck = false
        } else {
            pwMsg.removeClass('text-danger-emphasis')
            pwMsg.addClass('text-success-emphasis')
            pwMsg.text('비밀번호가 일치합니다.')
            passwordCheck = regexr.test($('#userPw').val())
        }
        if (!($('#userPw').val() && $('#userPwCheck').val())) {
        	pwMsg.text(`\u00a0`)
        	passwordCheck = false
        }
    })
    
    let emailCheck = /[a-z0-9]+@[a-z]+\.[a-z]{2,3}/
    
    let checkNum
    let phoneNum
    let phoneCheck = false
    
    $('#phoneNum').change(() => {
    	phoneCheck = false
    })
    
    
   	$('#sendCheckNumBtn').click(() => {
   		if($('#phoneNum').val().length > 9) {
     		checkNum = Math.floor(Math.random() * 1000000) + ''
     		while (checkNum.length != 6) {
     			checkNum = '0' + checkNum
     		}
     		
       	phoneNum = $('#phoneNum').val()
     		console.log(checkNum)
       	showOkModal('인증번호가 발송되었습니다.')
   		} else {
   	    	showOkModal('-를 제외한 10~11자리의 휴대폰 번호를 입력하세요')
   	    }
    })
    
    
    $('#phoneCheckBtn').click(() => {
        if($('#phoneCheckNum').val() == checkNum && phoneNum == $('#phoneNum').val()) {
            showOkModal('인증되었습니다.')
            phoneCheck = true
        } else {
        	showOkModal('인증번호가 일치하지 않습니다.')
        	phoneCheck = false
        }
    })
	
    $('#signUp').click(() => {
    	regexr = /[가-힣]{3}/
    	
        if(idCheck && passwordCheck && emailCheck.test($('#email').val()) && 
        		phoneCheck && regexr.test($('#userName').val()) && $('#birthday').val()) {        	
    		let mktg = $('#mktgAgreement').is(':checked') ? 'Y' : 'N'
        	
        	$.ajax({
              	url: 'signUp',
              	method: 'post',
              	contentType: 'application/json',
              	data: JSON.stringify({
              		userId: $('#userId').val(),
              		userPw: $('#userPw').val(),
              		email: $('#email').val(),
              		phoneNum: $('#phoneNum').val(),
              		userName: $('#userName').val(),
              		birthday: $('#birthday').val(),
              		mktgAgreement: mktg
              	})
            })
            
            let url = 'afterSignUp?userId=' + $('#userId').val()
            
            showOkModal('회원가입이 완료되었습니다.', url)
        } else {
            showOkModal('누락된 필수 입력사항이 있거나 휴대폰 인증이 완료되지 않았습니다.')
        }
    })
})
</script>
<style></style>
</head>
<body>
<header></header>
<div class='navigation fixed-top'>
    <div class='float-start mt-3 ms-2'><i class='bi bi-chevron-left' id='historyBtn'></i></div>
    <div class='menuName'>
        <h2 class='text-center pt-3'><b>회원가입</b></h2>
    </div>
</div>
<div class='container'>
<div class='col'>
    <div class='row'>
        <form class='text-truncate'>
            <div class='row mt-5 align-items-center'>
                <div class='col-3 text-end'>
                    *아이디
                </div>
                <div class='col-6'>
                    <input type='text' class='form-control' maxlength='10' id='userId' name='userId'/>
                </div>
                <div class='col-3'>
                    <button id='duplicateCheck' type='button' class='btn btn-darkBlue'>
                        중복확인
                    </button>
                </div>
            </div>
            <div class='row mt-2 align-items-center'>
                <div class='col-3 text-end'>
                    *비밀번호
                </div>
                <div class='col-6'>
                    <input id='userPw' type='password' class='form-control'
                        placeholder=' 6~12자리의 영문,숫자' maxlength='12' required/>
                </div>
            </div>
            <div class='row mt-2 align-items-center'>
                <div class='col-3 text-end'>
                    *비밀번호확인
                </div>
                <div class='col-6'>
                    <input id='userPwCheck' type='password' class='form-control'
                        placeholder=' 6~12자리의 영문,숫자' maxlength='12' required/>
                </div>
            </div>
            <div class='row'>
                <p id='pwMsg' class='text-center'>&nbsp;</p>
            </div>
            <div class='row mt-2 align-items-top'>
                <div class='col-3 text-end mt-2'>
                    *이메일
                </div>
                <div class='col-6'>
                    <input type='email' class='form-control' id='email'/>
                    <div class='row'>
                        <label class='mt-1'>
	                        <input type='checkbox' id='mktgAgreement'/>
	                        &nbsp; 마케팅 수신동의
                        </label>
                    </div>
                </div>
            </div>
            <div class='row mt-2 align-items-center'>
                <div class='col-3 text-end'>
                    *휴대폰번호
                </div>
                <div class='col-6'>
                    <input type='text' class='form-control' maxlength='11' id='phoneNum'/>
                </div>
                <div class='col-3'>
                    <button id='sendCheckNumBtn' type='button' class='btn btn-darkBlue'>
                        인증
                    </button>
                </div>
            </div>
            <div class='row mt-2 align-items-center'>
                <div class='col-3 text-end'>
                    *인증번호
                </div>
                <div class='col-6'>
                    <input id='phoneCheckNum' type='text' class='form-control'
                    maxlength='6' required/>
                </div>
                <div class='col-3'>
                    <button id='phoneCheckBtn' type='button' class='btn btn-darkBlue'>
                        확인
                    </button>
                </div>
            </div>
            <div class='row mt-2 align-items-center'>
                <div class='col-3 text-end'>
                    *이름
                </div>
                <div class='col-6'>
                    <input type='text' class='form-control' maxlength='5' id='userName'/>
                </div>
            </div>
            <div class='row mt-2 align-items-center'>
                <div class='col-3 text-end'>
                    *생년월일
                </div>
                <div class='col-6'>
                    <input type='date' class='form-control' id='birthday'/>
                </div>
            </div>
            <div class='row mt-1 justify-content-center'>
                <div class='col-5'>
                    <div class='row text-center'>
                        <label>*은 필수입력 사항입니다.</label>
                    </div>
                </div>
            </div>
            <div class='row mt-1 justify-content-center'>
                <div class='col-3 justify-content-center'>
                    <div class='row'>
                        <button id='signUp' type='button' class='btn btn-darkBlue'>
                            회원가입
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</div>
<footer></footer>
</body>
</html>