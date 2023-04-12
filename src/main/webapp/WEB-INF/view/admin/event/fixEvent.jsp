<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css' rel='stylesheet'/>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'/>
<link href='https://getbootstrap.com/docs/5.3/assets/css/docs.css' rel='stylesheet'/>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<link href='../../res/adminStyle.css' rel='stylesheet'/>
<script src='../../res/adminNavigation.js'></script>
<script src='../../res/modal.js'></script>
<title>ADMIN.NOTICE.03 이벤트 수정</title>
<script>
    $(() => {
        $('#noticeRevise').click(() => showConfirmModal('이벤트를 수정하시겠습니까?',
         '이벤트가 수정되었습니다.', '../event/01.html'))
    })
    $(() => {
        $('#noticeDelete').click(() => showConfirmModal('이벤트를 삭제하시겠습니까?',
         '이벤트가 삭제되었습니다.', '../event/01.html'))
    })
</script>
<style>
</style>
</head>
<body>
<header>
    <div class='container-fluid'>
        <div class='row'>
            <div class='col'>
                <div class='navigation fixed-top pt-2 pb-3' id='adminHeader'>
                    <div class='float-start m-4 ms-4'><a  class='border border-dark text-white p-2 mt-1' href='../main.html' id='logo'>로고이미지</a></div>
                    <h1 class='text-center pt-3 text-white'><b>이벤트수정</b></h1>
                </div>
            </div>
        </div>
    </div>
   <div class='row'>
        <div class='col'>
            <div class='navigation fixed-top pt-2' id='subHeader'>
                <h6 class='text-white p-2'>
                    <a href='../main.html'>메인</a> > <a href='./01.html'>이벤트</a>  > <a href='./03.html'>이벤트수정</a>
                </h6>
            </div>
        </div>
    </div>
</header>
<div class='row' id='mainBody'>
   <div class='col'>
        <form class='mb-4'>
            <div class='row'>
                <div class='col pt-2 d-flex gap-3 mb-4'>
                    <label for='noticeHeader'>
                        <h5 class='align-items-center text-nowrap pt-1'>제목</h5>
                    </label>
                    <div class='col'>
                        <input type='text' class='form-control' id='noticeHeader'/>
                    </div>
                </div>
            </div>
            <div class='ms-5'>
                <div class='col border p-5 mb-3'>
                    <h5 class='text-center'>이벤트이미지</h5>
                </div>
                <input class='mb-4' type='file'>
            </div>
            <div class='row'>
                <div class='col pt-2 d-flex gap-3 mb-4'>
                    <label for='noticeHeader'>
                        <h5 class='align-items-center text-nowrap pt-1'>내용</h5>
                    </label>
                    <div class='col'>
                        <textarea class='form-control' rows='10' id='noticeHeader'></textarea>
                    </div>
                </div>
            </div>
            <div class='d-flex gap-2 justify-content-end'>
                <button type='button' class='btn btn-olive'
                data-bs-toggle='modal' data-bs-target='#modal' id='noticeRevise'>
                    <i class='bi bi-check-circle'></i>
                    &nbsp;수정
                </button>
                <button type='button' class='btn btn-lightRed'
                data-bs-toggle='modal' data-bs-target='#modal' id='noticeDelete'>
                    <i class='bi bi-x-circle'></i>
                    &nbsp;삭제
                </button>
            </div>
        </form>
   </div>
</div>
<div class='modal modal-center fade' id='modal'>
    <div class='modal-dialog modal-smallsize'>
        <div class='modal-content'>
            <div class='pb-4' id='modalMsg'>
            </div>
            <div id='modalBtn'>
                <button type='button' class='btn btn-lightGray' data-bs-dismiss='modal'>아니오</button>
                <button type='button' class='btn btn-darkBlue' id='okBtn'>예</button>
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