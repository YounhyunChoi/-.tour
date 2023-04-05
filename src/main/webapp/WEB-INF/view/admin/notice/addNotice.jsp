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
<title>ADMIN.NOTICE.02 공지 추가</title>
<script>
$(() => {
	$('#noticeRegistrationBtn').click(() => {
		showConfirmModal('공지사항을 등록하시겠습니까?')
		
		$('#okBtn').click(() => {
		    if($('#noticeTitle').val() && $('#noticeContent').val()){
		    	$.ajax({
		    		url: 'adminAdd',
		    		method:'post',
		    		data: {
		    			noticeTitle: $('#noticeTitle').val(),
		    			noticeContent: $('#noticeContent').val()
		    		}
		    	})
		    	showOkModal('공지사항이 등록되었습니다.','adminList')
		    	
		    } else showOkModal('누락된 필수 입력사항이 있습니다. 확인 후 입력바랍니다.')
		})

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
                    <h1 class='text-center pt-3 text-white'><b>공지추가</b></h1>
                </div>
            </div>
        </div>
    </div>
   <div class='row'>
        <div class='col'>
            <div class='navigation fixed-top pt-2' id='subHeader'>
                <h6 class='text-white p-2'>
                    <a href='../admin/main'>메인</a> > <a href='../notice/adminList'>공지사항</a>  > <a href='../notice/adminAddView'>공지추가</a>
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
                        <input type='text' class='form-control' id='noticeTitle' maxlength='30'/>
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
                        <textarea class='form-control' rows='10' id='noticeContent' maxlength='300'></textarea>
                    </div>
                </div>
            </div>
            <div class='d-flex justify-content-end'>
                <button type='button' class='btn btn-darkBlue'id='noticeRegistrationBtn'>
                    <i class='bi bi-plus-circle'></i>
                    &nbsp;등록
                </button>
            </div>
        </form>
   </div>
</div>
<footer>
</footer>
</body>
</html>