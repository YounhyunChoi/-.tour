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
<title>myPage</title>
<style>
    .lightBlue {
        background-color: #dfebf6;
    }

    .myPageIcon {
        font-size: 50px;
    }
</style>
</head>
<body>
<header>
</header>
<div class='navigation fixed-top'>
    <div class='float-start mt-3 ms-2'><i class='bi bi-caret-left-fill' onclick="location.href='../main.html'"></i></div>
    <div class='menuName'>
        <h2 class='text-center pt-3'><b>My</b></h2>
    </div>
</div>
<div class='container'>
<div class='row'>
    <div class='col pt-4 m-2'>
        <div class='row py-3 px-3 border-bottom border-dark lightBlue'>
            <div class='col-8 d-flex align-items-center'>
                <h2 class='m-0'>${userId}님</h2>
            </div>
            <div class='col'>
                <a type='button' class='btn border-dark w-100' id='fixUserBtn' href='fixUser'>
                    <h5 class='m-1'>회원 수정</h5>
                </a>
            </div>
        </div>
        <div class='row py-2 px-3 border-bottom border-dark lightBlue'>
            <div class='col-2'>
                <i class='bi bi-calendar-check-fill myPageIcon'></i>
            </div>
            <div class='col-8 d-flex align-items-center'>
                <h2 class='m-0'>예약내역</h2>
            </div>
            <div class='col-2'>
                <a href='../reservation/02.html'>
                    <i class='bi bi-chevron-right myPageIcon'></i>
                </a>
            </div>
        </div>
        <div class='row py-2 px-3 border-bottom border-dark lightBlue'>
            <div class='col-2'>
                <i class='bi bi-heart myPageIcon'></i>
            </div>
            <div class='col-8 d-flex align-items-center'>
                <h2 class='m-0'>찜내역</h2>
            </div>
            <div class='col-2'>
                <a href='../wish/01.html'>
                    <i class='bi bi-chevron-right myPageIcon'></i>
                </a>
            </div>
        </div>
        <div class='row py-2 px-3 lightBlue'>
            <div class='col-2'>
                <i class='bi bi-chat-dots myPageIcon'></i>
            </div>
            <div class='col-8 d-flex align-items-center'>
                <h2 class='m-0'>내가 쓴 후기</h2>
            </div>
            <div class='col-2'>
                <a href='../review/01.html'>
                    <i class='bi bi-chevron-right myPageIcon'></i>
                </a>
            </div>
        </div>
        <div class='row pt-4'>
            <a href='../event/02.html'>
            <div class='p-5 border border-2 border-dark'>
                <div class='text-center'><h2>이벤트이미지</h2></div>
            </div>
            </a>
        </div>
    </div>
</div>
</div>
<footer>
</footer>
</body>
</html>