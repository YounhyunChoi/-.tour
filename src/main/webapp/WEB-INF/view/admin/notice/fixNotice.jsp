<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
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
<title>ADMIN.NOTICE.03 공지 수정</title>
<script>
 $(() => {
	$('#fixNoticeBtn').click(() => {
		showConfirModal('공지사항을 수정하시겠습니까?')
		
		
	})
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
                    <h1 class='text-center pt-3 text-white'><b>공지수정</b></h1>
                </div>
            </div>
        </div>
    </div>
   <div class='row'>
        <div class='col'>
            <div class='navigation fixed-top pt-2' id='subHeader'>
                <h6 class='text-white p-2'>
                    <a href='../main.html'>메인</a> > <a href='./01.html'>공지사항</a>  > <a href='./03.html'>공지수정</a>
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
                    <label for='noticeTitle'>
                        <h5 class='align-items-center text-nowrap pt-1'>제목</h5>
                    </label>
                    <div class='col'>
                        <input type='text' class='form-control' id='noticeTitle' value='${notice.noticeTitle}'/>
                    </div>
                </div>
            </div>
            <div class='ms-5'>
                <div class='col border p-5 mb-3'>
                    <h5 class='text-center'>공지사항이미지</h5>
                </div>
                <input class='mb-4' type='file'>
            </div>
            <div class='row'>
                <div class='col pt-2 d-flex gap-3 mb-4'>
                    <label for='noticeContent'>
                        <h5 class='align-items-center text-nowrap pt-1'>내용</h5>
                    </label>
                    <div class='col'>
                        <textarea class='form-control' rows='10' id='noticeContent' value='${notice.noticeContent}'></textarea>
                    </div>
                </div>
            </div>
            <div class='d-flex gap-2 justify-content-end'>
                <button type='button' class='btn btn-olive'id='fixNoticeBtn'>
                    <i class='bi bi-check-circle'></i>
                    &nbsp;수정
                </button>
                <button type='button' class='btn btn-lightRed'id='delNoticeBtn'>
                    <i class='bi bi-x-circle'></i>
                    &nbsp;삭제
                </button>
            </div>
        </form>
   </div>
</div>
<footer>
</footer>
</body>
</html>