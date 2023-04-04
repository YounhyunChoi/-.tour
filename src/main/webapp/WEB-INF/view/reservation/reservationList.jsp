<%@ page language='java' contentType='text/html; charset=UTF-8'  pageEncoding='UTF-8'%>

<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css' rel='stylesheet' />
    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css' />
    <link href='https://getbootstrap.com/docs/5.3/assets/css/docs.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
    <script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
    <link href='../res/style.css' rel='stylesheet' />
    <script src='../res/navigation.js'></script>
    <title>RESERVATION.02 예약내역</title>
    <script>
    
    </script>
    <style>
        .viewDetailBtn {
            font-size: 1.5rem;
        }

        #reviewAddBtn {
            background-color: #287094;
            width: 6rem;
            height: 2rem;
        }

        .image {
            flex-wrap: wrap;
            justify-content: center;
            align-content: center;
            border: 1px solid #dee2e6;
            border-color: #212529;
            border-width: 2px;
            width: 6.5rem;
            height: 6rem;
        }
    </style>
</head>
<header>
</header>
<div class='navigation fixed-top'>
    <div class='float-start mt-2 ms-2'><i class='bi bi-caret-left-fill' onclick="location.href='../user/mypage.html'"></i></div>
    <div class='menuName'>
        <h2 class='text-center pt-3'><b>예약내역</b></h2>
    </div>
</div>
<div class='container px-4'>
    <div class='row mt-4 d-flex flex-column shadow-sm border border-1'>
        <div class='col p-2 border-bottom'>
            <div class='row'>
                <div class='col-8 fs-4'>예약일: 2023-04-15</div>
                <div class='col-4 text-end'>
                    <button type='button' class='border-0 bg-white' onclick="location.href='../tour/02.html'">
                        <span class='fs-5'>상세보기</span>
                        <i class='bi bi-chevron-right viewDetailBtn'></i>
                    </button>
                </div>
            </div>
        </div>
        <div class='col my-3'>
            <div class='row'>
                <div class='col-4'>
                    <div class='d-flex flex-column align-items-center'>
                        <p class='mb-1'>예약번호 0002</p>
                        <div class='d-flex image'>
                            <span>여행코스이미지</span>
                        </div>
                    </div>
                </div>
                <div class='col-5 fs-5'><b>서울시티투어 버스</b></div>
                <div class='col-3 d-flex align-self-end'>
                    <button type='button' id='reviewAddBtn' onclick="location.href='../review/02.html'"
                        class='border border-0 rounded text-white invisible'>후기등록</button>
                </div>
            </div>
        </div>
    </div>
    <div class='row mt-4 d-flex flex-column shadow-sm border border-1'>
        <div class='col p-2 border-bottom'>
            <div class='row'>
                <div class='col-8 fs-4'>예약일: 2022-02-17</div>
                <div class='col-4 text-end'>
                    <button type='button' class='border-0 bg-white' onclick="location.href='../tour/02.html'">
                        <span class='fs-5'>상세보기</span>
                        <i class='bi bi-chevron-right viewDetailBtn'></i>
                    </button>
                </div>
            </div>
        </div>
        <div class='col my-3'>
            <div class='row'>
                <div class='col-4'>
                    <div class='d-flex flex-column align-items-center'>
                        <p class='mb-1'>예약번호 0001</p>
                        <div class='d-flex image'>
                            <span>여행코스이미지</span>
                        </div>
                    </div>
                </div>
                <div class='col-5 fs-5'><b>전통주 체험</b></div>
                <div class='col-3 d-flex align-self-end'>
                    <button type='button' id='reviewAddBtn' onclick="location.href='../review/02.html'"
                        class='border border-0 rounded text-white visible'>후기등록</button>
                </div>
            </div>
        </div>
    </div>
</div>
<footer>
</footer>
</body>
</html>