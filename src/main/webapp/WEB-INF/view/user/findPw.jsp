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
<title>findPw</title>
<script>
$(() => {
	let msg = null;
	let checkNum = null;
	
    $('#sendCheckNum').click(() => {
    	$.ajax({
			url: 'getUsers',
			dataType: 'json',
			success: users => {
				$.each(users, (i, user) => {
					if(user.userId == $('#userId').val()) {
						if(user.email == $('#email').val()) {
							msg = '인증번호가 발송되었습니다.'
							
							checkNum = Math.floor(Math.random() * 1000000) + ''
							while (checkNum.length != 6) {
					  			checkNum = '0' + checkNum
					  		}
							
							console.log(checkNum)
							return false;
						} else {
							msg = '이메일이 일치하지 않습니다.'
							
							return false;
						}
					} else {
						msg = '아이디가 일치하지 않습니다.'
					}
				})
				
				showOkModal(msg)
			}
		})
    })
    
    $('#fixPw').click(() => {
    	if(checkNum == $('#emailCheckNum').val()) {
    		showOkModal('인증되었습니다.')
    		
    		$.ajax({
    			url: 'findPw',
    			method: 'post',
    			data: {
    				userId: $('#userId').val()
    			}
    		})
    		
    		$('#modalOk').find('a').attr('data-bs-dismiss', '')
            .attr('href', 'fixPw')
    	} else {
    		showOkModal('인증번호가 일치하지 않습니다.')
    	}
    })
})
</script>
</head>
<body>
<header>
</header>
<div class='navigation fixed-top'>
   <div class='float-start mt-3 ms-2'><i class='bi bi-caret-left-fill'></i></div>
   <div class='menuName'>
      <h2 class='text-center pt-3'><b>비밀번호찾기</b></h2>
   </div>
</div>
<div class='container'>
<div class='row'>
    <div class='col'>
        <div class='row'>
            <div class='col mt-5 justify-content-center'>
                <input type='text' class='form-control' placeholder='아이디'
                id='userId' name='userId'/>
            </div>
        </div>
        <div class='row'>
            <div class='col mt-2 justify-content-center'>
                <input type='text' class='form-control' placeholder='이메일'
				id='email'/>
            </div>
        </div>
        <div class='row'>
            <div class='col mt-2'>
                <button type='button' class='btn btn-darkBlue form-control'
				id='sendCheckNum'>
                    <span>인증번호 발송</span>
                </button>
            </div>
        </div>
        <div class='row'>
            <div class='col mt-2 justify-content-center'>
                <input type='text' class='form-control' placeholder='인증번호'
				id='emailCheckNum'/>
            </div>
        </div>
        <div class='row'>
            <div class='col mt-2'>
                <button type='button' class='btn btn-darkBlue form-control'
                id='fixPw'>
                    <span>비밀번호 변경</span>
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