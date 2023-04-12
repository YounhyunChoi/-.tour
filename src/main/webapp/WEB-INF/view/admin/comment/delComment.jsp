<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css' rel='stylesheet'/>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'/>
<link href='https://getbootstrap.com/docs/5.3/assets/css/docs.css' rel='stylesheet'/>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<link href='../../res/adminStyle.css' rel='stylesheet'/>
<script src='../../res/adminNavigation.js'></script>
<script src='../../res/modal.js'></script>
<title></title>
<script>
    $(() => {
        $('#delete').click(() => {
       		$.ajax({
       			url: 'del',
       			method: 'delete',
       			data: {
       				comtNum: `${param.comtNum}`
       			}
       		})
       		showOkModal('댓글을 삭제하시겠습니까?', 'adminList')
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
                    <h1 class='text-center pt-3 text-white'><b>댓글조회</b></h1>
                </div>
            </div>
        </div>
    </div>
   <div class='row'>
        <div class='col'>
            <div class='navigation fixed-top pt-2' id='subHeader'>
                <h6 class='text-white p-2'>
                    <a href='../main.html'>메인</a> > <a href='./01.html'>댓글</a> > <a href='./02.html'>댓글조회</a>
                </h6>
            </div>
        </div>
    </div>
</header>
<div class='row' id='mainBody'>
    <div class='row '>
        <div class='col-3 border border-secondary p-2'>
            <a>후기번호 0001</a>
        </div>
        <div class='col-9 border border-secondary p-2'>
            <a>서울시티투어 버스</a>
        </div>
    </div>
    <div class='row'>
        <div class='row shadow-sm mx-1 border border-lightGray mt-3'>
            <div class='col-4 p-0 reviewImage m-3 mx-1'>후기이미지</div>
            <div class='col pe-0'>
                <div class='row mt-1 text-end'>
                    <h6>작성일 2023-03-15</h6>
                </div>
                <div class='row mt-2'>
                    <h5>제목 코스가 너무 마음에 들어요<br>
                        평점 ★★★★★<br>
                        java01
                    </h5>
                </div>
            </div>
            <h3>장소가 너무 예쁘니까 어느 방향으로 사진을 찍어도 작품처럼 나오네요.</h3>
        </div>
    </div>
    <div class='row'>
        <div class='row shadow-sm mx-1 border border-lightGray mt-3'>
            <div class='col-3 pt-3'>
                <p class='mb-1'>댓글번호 0002</p>
                <h4>java01</h4>
            </div>
            <div class='col-4 text-start pt-4'>
                <h3>XX야</h3>
            </div>
            <div class='col-4 text-end align-text-bottom pt-5'>
                <h6 class='pt-4'>작성일 2023-03-09</h6>
            </div>
            <div class='col-1 d-flex justify-content-end'>
                <a class='icon btn bi bi-x' id='delete'></a>
            </div>
        </div>
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