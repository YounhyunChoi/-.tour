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
<script>
$(() => {
	let reviews = ''
	
	$.ajax
	
	$('#container')
})
</script>
<title></title>
<style>
    .page-link {
        color:black;
    }
</style>
</head>
<body>
<header>
</header>
<div class='navigation fixed-top'>
    <div class='float-start mt-2 ms-2'><i class='bi bi-chevron-left' id='historyBtn'></i></div>
    <div class='menuName'>
        <h2 class='text-center pt-3'><b>후기 목록</b></h2>
    </div>
</div>
<div class='container'>
    <form>
        <div class='row d-flex align-items-center mx-2 mt-3'>
            <div class='col-3'>
                <select class='form-select'>
                    <option selected>제목</option>
                    <option>내용</option>
                    <option>후기번호</option>
                    <option>여행코스명</option>
                    <option>아이디</option>
                </select>
            </div>
            <div class='col-8'>
                <input type='text' class='form-control'>
            </div>
            <div class='col-1 p-0'>
                <a href='#'>
                    <i class='bi bi-search icon'></i>
                </a>
            </div>
        </div>
    </form> 
    <div class='row mx-2 mt-3 shadow-sm border'>
        <div class='col'>
            <div class='row align-items-center border-bottom'>
                <div class='col-4 fs-6'>후기번호 0004</div>
                <div class='col-5 px-0'>서울시티투어 버스</div>
                <div class='col-3 text-nowrap text-end'>
                    <button type='button' class='border-0 bg-white' onclick="location.href='05.html'">
                        <span class='fs-5'>상세보기</span>
                        <i class='bi bi-chevron-right viewDetailBtn'></i>
                    </button>
                </div>
            </div>
            <div class='row mt-2'>
                <div class='col-3 me-4'>
                    <div class='reviewImage'>후기이미지</div>
                </div>
                <div class='col ms-2 fs-5 text-left'>
                    제목 행복한여행<br>
                    평점 ★★★★★
                    <br>java01
                </div>
            </div>
            <div class='row'>
                <p class='text-end'>
                    작성일 2023-03-15
                </p>
            </div>
        </div>
    </div>
</div>
<footer>
</footer>
</body>
</html>