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
<title>findId</title>
<script>
$(() => {
    $('#findId').click(() => {
    	$.ajax({
			url: 'getUsers',
			dataType: 'json',
			success: users => {
				let msg = null;
				let url = null;
				
				$.each(users, (i, user) => {
					if(user.userName == $('#userName').val()) {
						if(user.email == $('#email').val()) {
							msg = '찾으시는 아이디는 ' + user.userId + ' 입니다.'
							url = 'login'
							
							return false;
						} else {
							msg = '이메일이 일치하지 않습니다.'
						}
					} else if(user.email == $('#email').val()) {
						msg = '이름이 일치하지 않습니다.'
					}
				})
				
				if(msg) {
					showOkModal(msg, url)
				} else {
					showOkModal('가입된 아이디가 없습니다.', 'signUp')
				}
			}
		})
    })
})
</script>
</head>
<body>
<header></header>
<div class='navigation fixed-top'>
   <div class='float-start mt-3 ms-2'><i class='bi bi-chevron-left' id='historyBtn'></i></div>
   <div class='menuName'>
      <h2 class='text-center pt-3'><b>아이디 찾기</b></h2>
   </div>
</div>
<div class='container'>
<div class='row'>
    <div class='row'>
        <div class='col mt-5 justify-content-center'>
            <input type='text' class='form-control' placeholder='이름' id='userName'/>
        </div>
    </div>
    <div class='row'>
        <div class='col mt-2 justify-content-center'>
            <input type='text' class='form-control' placeholder='이메일' id='email'/>
        </div>
    </div>

    <div class='row'>
        <div class='col mt-2'>
            <button type='button' class='btn btn-darkBlue form-control' id='findId'>
                <span>아이디 찾기</span>
            </button>
        </div>
    </div>
</div>
</div>
<footer></footer>
</body>
</html>