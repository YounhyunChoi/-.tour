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
        $('#password').click(() => showOkModal('비밀번호가 변경되었습니다.', '../user/01.html'))
    })
</script>
</head>
<body>
<header>
</header>
<div class='navigation fixed-top'>
   <div class='float-start mt-3 ms-2'><i class='bi bi-caret-left-fill'></i></div>
   <div class='menuName'>
      <h2 class='text-center pt-3'><b>비밀번호 재설정</b></h2>
   </div>
</div>
<div class='container'>
<div class='row mt-5'>
    <div class='row'>
        <div class='col mt-5 justify-content-center'>
            <label for='password1'>비밀번호</label>
            <input type='password' class='form-control' 
            placeholder='6~12자리의 영문,숫자' id='password1'/>
        </div>
    </div>
    <div class='row'>
        <div class='col mt-2 justify-content-center'>
            <label for='password2'>비밀번호 확인</label>
            <input type='password' class='form-control' 
            placeholder='6~12자리의 영문,숫자' id='password2'/>
        </div>
    </div>
    <div class='row'>
        <div class='col mt-2'>
            <button type='submit' class='btn btn-darkBlue form-control' id='password'>
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