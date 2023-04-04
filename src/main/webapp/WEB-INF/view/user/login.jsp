<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css' rel='stylesheet'>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'/>
<link href='https://getbootstrap.com/docs/5.3/assets/css/docs.css' rel='stylesheet'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<link href='../res/style.css' rel='stylesheet'/>
<script src='../res/navigation.js'></script>
<script src='../res/modal.js'></script>
<script>
$(() => {
	$('#loginBtn').click(e => {
		e.preventDefault()
		$.ajax({
			url: 'get',
			data: {
				userId: $('#userId').val()
			},
			dataType: 'json',
			success: user => {
				if(user.length && user.at(0).userPw == $('#userPw').val()) {
					$('form').submit()
				} else {
					showOkModal('아이디 또는 비밀번호를 잘못 입력했습니다.')
					console.log(user)
				}
			}
		})
	})
})
</script>
  <title>login</title>
<style>
    .loginFooter{
        color: black;
    }
    .container{
        margin-top: 3rem;
    }

</style>
</head>
<body>
<header></header>
<div class='navigation fixed-top'>
	<div class='float-start ms-2 mt-3'><i class='bi bi-caret-left-fill'></i></div>
	<div class='menuName'>
	    <h2 class='text-center pt-3'><b>로그인</b></h2>
	</div>
</div>
<div class='container'>
    <div class='row pt-5'>
        <div class='col'>
            <form method='post'>
                <div class='row'>
                    <div class='col'>
                        <div class='row mb-3'>
                            <div class='col'>
                                <input type='text' class='form-control'
                                placeholder='아이디' name='userId' id='userId'
                                value='${user.userId}'/>
                            </div>
                        </div>
                        <div class='row'>
                            <div class='col'>
                                <input type='password' class='form-control' 
                                	placeholder='비밀번호' name='userPw' id='userPw'/>
                            </div>
                        </div>
                        <div class='row'>
                            <div class='col mb-2'>
                                <input type='checkbox' class='mt-3' 
                                	name='saveId' ${saveId}/>&nbsp;<b>아이디 저장</b>
                            </div>
                        </div>
                        <div class='row'>
                            <div class='col'>
                                <button type='submit' class='btn btn-darkBlue form-control'
                                 id='loginBtn'>
                                    <span>로그인</span>
                                </button>
                            </div>
                        </div>
                    </div>  
                </div>
            </form>
        </div>
        <div class='row'>
            <div class='col text-center mt-3'>
                <a href='findId' class='loginFooter'>아이디 찾기&nbsp;|</a>
                <a href='findPw' class='loginFooter'>비밀번호 찾기&nbsp;|</a>
                <a href='signUp' class='loginFooter'>회원가입</a>
            </div>
        </div>
    </div>
</div>
<footer></footer>
</body>
</html>