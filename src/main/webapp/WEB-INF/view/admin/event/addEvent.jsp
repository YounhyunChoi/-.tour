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
<title>ADMIN.EVENT.02 이벤트 추가</title>
<script>
    $(() => {
        $('#eventRegistration').click(() => showConfirmModal('이벤트를 추가하시겠습니까?',
         '이벤트가 추가되었습니다.', '../event/01.html'))
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
            <c:if test='${logoName != null}'>
                <div class='float-start ms-4 mt-1' style='height: 50px;'>
        			<a href='../user/adminMain'>
                		<img src='<c:url value="/attach/${logoName}"/>' id='logo'/>
                	</a>
               	</div>
			</c:if>
			<c:if test='${logoName == null}'>
				<div class='float-start m-4 ms-4'>
					<a  class='border border-dark text-white p-2 mt-1' href='../user/adminMain' id='logo'>
						로고이미지
					</a>
				</div>
			</c:if>
            <h1 class='text-center pt-3 text-white'><b>이벤트추가</b></h1>
            </div>
        </div>
    </div>
   <div class='row'>
        <div class='col'>
            <div class='navigation fixed-top pt-2' id='subHeader'>
                <h6 class='text-white p-2'>
                    <a href='../user/adminMain'>메인</a> > <a href='../event/adminList'>이벤트</a>  > <a href='../event/addEvent'>이벤트추가</a>
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
            <div class='d-flex justify-content-end'>
                <button type='button' class='btn btn-darkBlue'
                data-bs-toggle='modal' data-bs-target='#modal' id='eventRegistration'>
                    <i class='bi bi-plus-circle'></i>
                    &nbsp;등록
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