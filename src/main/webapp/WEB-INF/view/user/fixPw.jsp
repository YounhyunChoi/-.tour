<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css' rel='stylesheet'/>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'/>
<link href='https://getbootstrap.com/docs/5.3/assets/css/docs.css' rel='stylesheet'/>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<link href='../res/style.css' rel='stylesheet'/>
<script src='../res/navigation.js'></script>
<script src='../res/modal.js'></script>
<title>fixPw</title>
<script>
    $(() => {
    	let passwordCheck
    	$('input').keyup(function () {
        	let regexr = /[a-z0-9]{6}/
            let pwMsg = $('#pwMsg')
            if (($('#password1').val() !== $('#password2').val()) &&
            		($('#password1').val() && $('#password2').val())) {
                pwMsg.removeClass('text-success-emphasis')
                pwMsg.addClass('text-danger-emphasis')
                pwMsg.text('비밀번호가 일치하지 않습니다.')
                passwordCheck = false
            } else {
                pwMsg.removeClass('text-danger-emphasis')
                pwMsg.addClass('text-success-emphasis')
                pwMsg.text('비밀번호가 일치합니다.')
                passwordCheck = regexr.test($('#password1').val())
            }
            if (!($('#password1').val() && $('#password2').val())) {
            	pwMsg.text(`\u00a0`)
            	passwordCheck = false
            }
        })
        
        $('#fixPwBtn').click(() => {
        	if(passwordCheck) {
        		$.ajax({
                  	url: 'fixPw',
                  	method: 'put',
                  	contentType: 'application/json',
                  	data: JSON.stringify({
                  		userId: '${param.userId}',
                  		userPw: $('#password1').val()
                  	})
                })
        		showOkModal('비밀번호가 변경되었습니다.', 'login')
        	} else {
        		showOkModal('영문, 숫자로 구성된 6~12자리 비밀번호를 입력해주세요.')
        	}
        })
    })
</script>
</head>
<body>
<header>
</header>
<div class='navigation fixed-top'>
   <div class='float-start mt-3 ms-2'><i class='bi bi-chevron-left' id='historyBtn'></i></div>
   <div class='menuName'>
      <h2 class='text-center pt-3'><b>비밀번호 재설정</b></h2>
   </div>
</div>
<div class='container'>
<div class='row mt-5'>
    <div class='row'>
        <div class='col mt-5 justify-content-center'>
            <label for='password1'>비밀번호</label>
            <input type='password' class='form-control' maxlength='12'
            placeholder='6~12자리의 영문,숫자' id='password1'/>
        </div>
    </div>
    <div class='row'>
        <div class='col mt-2 justify-content-center'>
            <label for='password2'>비밀번호 확인</label>
            <input type='password' class='form-control' maxlength='12'
            placeholder='6~12자리의 영문,숫자' id='password2'/>
        </div>
    </div>
    <div class='row'>
        <p id='pwMsg' class='text-center'>&nbsp;</p>
    </div>
    <div class='row'>
        <div class='col mt-2'>
            <button type='button' class='btn btn-darkBlue form-control'
            id='fixPwBtn'>
                <span>비밀번호 변경</span>
            </button>
        </div>
    </div>
</div>
</div>
<footer>
</footer>
</body>
</html>