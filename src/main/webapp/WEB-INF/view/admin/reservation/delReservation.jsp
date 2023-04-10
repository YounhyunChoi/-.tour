<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
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
<title></title>
<script>
$.ajax({
	url: 'adminGet',
	dataType: 'json',
	data: {
		userId: `${param.userId}`
	},
	success: reservations => {
		
	}
	
})

$(() => {
    $('#cancel').click(() => showConfirmModal('예약 취소 하시겠습니까?', '예약이 취소되었습니다.'))
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
                    <h1 class='text-center pt-3 text-white'><b>예약조회</b></h1>
                </div>
            </div>
        </div>
    </div>
   <div class='row'>
        <div class='col'>
            <div class='navigation fixed-top pt-2' id='subHeader'>
                <h6 class='text-white p-2'>
                    <a href='../main.html'>메인</a> > <a href='../user/01.html'>회원목록</a> > <a href='./01.html'>예약조회</a>
                </h6>
            </div>
        </div>
    </div>
</header>
<div class='row' id='mainBody'>
    <div class='row'>
        <table class='table mt-3 table-bordered border-lighGray text-center table-sm'>
            <thead class='table-lightGray'>
                <tr>
                    <th>예약번호</th>
                    <th>예약일</th>
                    <th>코스명</th>
                    <th>결제금액</th>
                    <th>예약취소</th>
                </tr>
            </thead>
            <tbody class='align-middle'>
                <tr>
                    <td>0005</td>
                    <td>2023-03-21</td>
                    <td>[당일여행] 도심 속 역사와 예술 이야기</td>
                    <td>99,999원</td>
                    <td>
                        <a id='cancel' class='btn btn-lightRed' 
                        data-bs-toggle='modal' data-bs-target='#modal'>취소</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <nav aria-label='Page navigation example'>
        <ul class='pagination d-flex justify-content-center  mt-5' id='indexNum'>
            <li class='page-item'>
                <a class='page-link' href='#' aria-label='Previous'>
                    <span aria-hidden='true'>&laquo;</span>
                </a>
            </li>
            <li class='page-item'>
                <a class='page-link' href='#' aria-label='Previous'>
                    <span aria-hidden='true'>&lsaquo;</span>
                </a>
            </li>
            <li class='page-item'><a class='page-link' href='#'>1</a></li>
            <li class='page-item'><a class='page-link' href='#'>2</a></li>
            <li class='page-item'><a class='page-link' href='#'>3</a></li>
            <li class='page-item'><a class='page-link' href='#'>4</a></li>
            <li class='page-item'><a class='page-link' href='#'>5</a></li>
            <li class='page-item'>
                <a class='page-link' href='#' aria-label='Next'>
                    <span aria-hidden='true'>&rsaquo;</span>
                </a>
            </li>
            <li class='page-item'>
                <a class='page-link' href='#' aria-label='Next'>
                    <span aria-hidden='true'>&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
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