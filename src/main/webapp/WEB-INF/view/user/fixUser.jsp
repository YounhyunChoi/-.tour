<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css' rel='stylesheet' />
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css' />
<link href='https://getbootstrap.com/docs/5.3/assets/css/docs.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<link href='../res/style.css' rel='stylesheet' />
<script src='../res/navigation.js'></script>
<script src='../res/modal.js'></script>
<title>fixUser</title>
<script>
$(() => {
	let regexr
	let passwordCheck

	$('input').keyup(() => {
    	regexr = /[a-z0-9]{6}/
        let pwMsg = $('#pwMsg')
        if ($('#userPw').val() !== $('#userPwCheck').val() && $('#userPw').val()) {
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
    	
        if (!$('#userPw').val()) {
        	pwMsg.text(`\u00a0`)
        	passwordCheck = false
        }
    })
	
	let checkNum
	let phoneNum
	let phoneCheck = false
	
	$('#phoneNum').change(() => {
		phoneCheck = false
	})
	
	$('#sendCheckNumBtn').click(() => {
		checkNum = Math.floor(Math.random() * 1000000) + ''
		while (checkNum.length != 6) {
  			checkNum = '0' + checkNum
  		}
		
		phoneNum = $('#phoneNum').val()
  		console.log(checkNum)
    	showOkModal('인증번호가 발송되었습니다.')
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
    
    $('#fixUserBtn').click(() => {
    	if(passwordCheck && regexr.test($('#email').val()) && phoneCheck) {
	    	regexr = /[a-z0-9]+@[a-z]+\.[a-z]{2,3}/
    		let mktg = $('#mktgAgreement').is(':checked') ? 'Y' : 'N'
    				
    		$.ajax({
    			url: 'fixUser',
    			method: 'put',
    			contentType: 'application/json',
    			data: JSON.stringify({
    				userId: '${user.userId}',
    				userPw: $('#userPw').val(),
    				email: $('#email').val(),
    				phoneNum: $('#phoneNum').val(),
    				mktgAgreement: mktg
    			})
    		})
    		$('#fixUserBtn').attr('href', 'afterFixUser')
   		} else {
       		showOkModal('누락된 필수 입력사항이 있거나 휴대폰 인증이 완료되지 않았습니다.')
       	}
    })
    
    $('#delUserBtn').click(() => {
    	showConfirmModal('정말 탈퇴하시겠습니까?')
    	
    	$('#okBtn').click(() => {
    		$.ajax({
    			url: 'delUser',
    			method: 'delete'
    		})
    		
    	$('#okBtn').attr('href', 'afterDelUser')
    	})
    })
})
</script>
<style>
  .userBtn {
     width: 5rem;
     height: 2.5rem;
  }
</style>
</head>
<body>
   <header>
   </header>
   <div class='navigation fixed-top'>
      <div class='float-start mt-3 ms-2'><i class='bi bi-chevron-left' id='historyBtn' onclick="location.href='./mypage.html'"></i></div>
     <div class='menuName'>
        <h2 class='text-center pt-3'><b>회원수정</b></h2>
     </div>
  </div>
  <div class='container mt-5 px-4'>
<div class='row justify-content-center'>
     <div class='row d-flex flex-column'>
        <div class='row'>
           <div class='col-4'>아이디:</div>
           <div class='col-4'>${user.userId}</div>
        </div>
        <div class='row'>
           <div class='col-4'>이름:</div>
           <div class='col-4'>${user.userName}</div>
        </div>
        <div class='row'>
           <div class='col-4'>생년월일:</div>
           <div class='col-4'>${user.birthday}</div>
        </div>
     </div>
 </div>
  <div class='row mt-4 justify-content-center'>
     <div class='row d-flex flex-column'>
        <div class='row align-items-center'>
           <div class='col-4'><label for='password'>*비밀번호</label></div>
           <div class='col-8 p-0'><input type='password' class='form-control' 
           placeholder='6~12자리의 영문,숫자' maxlength='12' id='userPw'/></div>
        </div>
        <div class='row mt-3 align-items-center'>
           <div class='col-4'><label for='password'>*비밀번호 확인</label></div>
           <div class='col-8 p-0'><input type='password' class='form-control' 
           placeholder='6~12자리의 영문,숫자' maxlength='12' id='userPwCheck'/></div>
        </div>
        <div class='row'>
             <p id='pwMsg' class='text-center'>&nbsp;</p>
         </div>
        <div class='row mt-3 align-items-center'>
           <div class='col-4'><label for='text'>*이메일</label></div>
           <div class='col-8 p-0'><input type='text' class='form-control'
           value='${user.email}' id='email'/></div>
        </div>
        <div class='row mt-2'>
           <div class='col d-flex justify-content-end align-items-center'>
               <input type='checkbox' id='mktgAgreement' ${mktgAgreement}/>
                <a>&nbsp; 마케팅 수신동의</a>
            </div>
         </div>
         <div class='row mt-3 align-items-center'>
            <div class='col-4'><label for='text'>*휴대폰번호</label></div>
            <div class='col-5 p-0'><input type='tel' class='form-control' 
            value='${user.phoneNum}' id='phoneNum'/></div>
            <div class='col-3'>
               <button type='button' id='sendCheckNumBtn'
               class='btn btn-darkBlue form-control'>
                  <span>인증</span>
               </button>
         	</div>
         </div>
         <div class='row mt-3 align-items-center'>
            <div class='col-4'><label for='text'>*인증번호</label></div>
            <div class='col-5 p-0'><input type='number' class='form-control'
             						id='phoneCheckNum'/></div>
            <div class='col-3'>
               <button type='button' id='phoneCheckBtn' 
               class='btn btn-darkBlue form-control'>
                  <span>확인</span>
               </button>
            </div>
         </div>
         <div class='row mt-4 d-felx flex-column'>
            <div class='col text-center'><a>*은 필수입력 사항입니다.</a></div>
            <div class='col mt-4 gap-2 d-flex justify-content-center'>
               <a type='button' id='fixUserBtn' 
               class='userBtn btn btn-darkBlue border-0 rounded text-center text-white'>
               	확인
               </a>
               <button type='button' id='delUserBtn' 
               class='userBtn btn btn-lightRed border-0 rounded text-center text-white'>
               	회원탈퇴
               </button>
            </div>
         </div>
      </div>
   </div>
  </div>
<footer>
</footer>
</body>
</html>