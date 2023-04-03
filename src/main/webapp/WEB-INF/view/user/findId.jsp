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
<title>findId</title>
<script>
$(() => {
    $('#findId').click(() => {
    	
    })
})
</script>
</head>
<body>
<header>
</header>
<div class='navigation fixed-top'>
   <div class='float-start mt-2 ms-2'><i class='bi bi-caret-left-fill'  onclick="location.href='./01.html'"></i></div>
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
<div class='modal modal-center fade' id='modal'>
    <div class='modal-dialog modal-smallsize'>
        <div class='modal-content'>
            <div class='pb-4' id='modalMsg'>
            </div>
            <div id='modalOk'>
                <a type='button' class='btn btn-darkBlue' data-bs-dismiss='modal'>확인</a>
            </div>
        </div>
    </div>
</div>
<footer>
</footer>
</body>
</html>