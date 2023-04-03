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
<title>admin main</title>
<style>
    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }

    #mainBody {
        font-family: 'Pretendard-Regular';
        padding-top: 4rem;
    }

   #adminHeader{
        background-color:  lightslategray;
        z-index: 1;
        border-bottom: .2rem solid white;
        margin: 0 .7rem 0 .7rem;
   }

   #logo{
        text-decoration: none;
   }

    #navItem li {
        list-style-type: none;
    }

    .nav-link {
        text-decoration: none;
        color: white;
    }

    #navItem {
       width: 170px;
       height: 1000px;
       position: fixed;
       background-color: lightslategray;
    }

    #navItem a {
        text-decoration: none;  
        color: white;
    }

    #subBody{
        margin-left: 11.5rem;
    }

    .noticeList li{
        margin-left: .5rem;
        padding-right: 1rem;
    }

    .noticeList a{
        text-decoration: none;
        color: black;
    }

    .adminBody{
        box-shadow: .4rem .4rem .2rem 0rem lightgray;
    }

    input[type=file]::file-selector-button {
        width: 5rem;
        height: 2rem;
        color: white;
        background: lightslategray;
        border: .1rem solid lightslategray;
        border-radius: .3rem;
        cursor: pointer;
    }
</style>
</head>
<body id='mainBody'>
<div class='container-fluid'>
    <div class='row'>
        <div class='col'>
            <header>
                <div class='navigation fixed-top pt-2 pb-3' id='adminHeader'>
                    <div class='float-start m-4 ms-4'><a  class='border border-dark text-white p-2 mt-1' href='#' id='logo'>로고이미지</a></div>
                    <h1 class='text-center pt-3 text-white'><b>MAIN</b></h1>
                </div>
            </header>
        </div>
    </div>
    <div class='row'>
      <div class='col-2'>
            <nav class='nav'>
                <div id='navItem'>
                    <ul class='mt-5'>
                        <li><a class='nav-link' href='logout'>로그아웃</a></li>
                        <li><a class='nav-link' href='./user/01.html'>회원목록</a></li>
                        <li><a class='nav-link' href='./tour/01.html'>상품목록</a></li>
                        <li class='mt-4 text-decoration-underline'>게시판</li>
                        <li><a class='nav-link' href='./review/01.html'>후기</a></li>
                        <li><a class='nav-link' href='./comment/01.html'>댓글</a></li>
                        <li><a class='nav-link' href='./notice/01.html'>공지사항</a></li>
                        <li><a class='nav-link' href='./event/01.html'>이벤트</a></li>
                        <li class='mt-4 text-decoration-underline'>고객센터</li>
                        <li><a class='nav-link' href='./faq/01.html'>FAQ</a></li>
                        <li><a class='nav-link' href='./report/01.html'>신고목록</a></li>
                    </ul>
                </div>
            </nav>
      </div>
      <div class='col-9 mt-4' id='subBody'>
            <div class='row'>
                <div class='col'>
                    <div class='border border-dark p-5 mt-3  text-center'>
                        로고이미지
                    </div>
                </div>
            </div>
            <div class='row'>
                <div class='col pt-2'>
                    <input type='file' id='logoUp'/>
                </div>
            </div>
            <div class='row pt-5'>
                <div class='col noticeList'>
                    <div class='border border-dark rounded-3 pt-3 adminBody'>
                        <ol reversed><h5 class='pb-2'><b>공지사항</b></h5>
                            <li>
                                <a href='../admin/notice/03.html'>[공지] 설 연휴 일정 변경 안내</a>
                                <p></p>
                                <p>작성일 2023-01-16</p>
                                <hr>
                            </li>
                            <li>
                                <a href='#'>[공지] 시스템 점검 안내</a>
                                <p></p>
                                <p>작성일 2022-12-10</p>
                                <hr>
                            </li>
                            <li>
                                <a href='#'>[공지] 코로나19관련 여행 안내</a>
                                <p></p>
                                <p>작성일 2022-05-05</p>
                                <hr>
                            </li>
                        </ol>
                    </div>
                </div>
                <div class='col noticeList'>
                    <div class='border border-dark rounded-3 pt-3 adminBody'>
                        <ol reversed><h5 class='pb-2'><b>이벤트</b></h5>
                            <li>
                                <a href='../admin/event/03.html'>[EVENT] 설 특가 이벤트</a>
                                <p></p>
                                <p>작성일 2023-01-16</p>
                                <hr>
                            </li>
                            <li>
                                <a href='#'>[EVENT] 크리스마스 특가 이벤트</a>
                                <p></p>
                                <p>작성일 2022-12-10</p>
                                <hr>
                            </li>
                            <li>
                                <a href='#'>[EVENT] 가정의날 특가 이벤트</a>
                                <p></p>
                                <p>작성일 2022-05-05</p>
                                <hr>
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </div>
<footer>
</footer>
</body>
</html>
