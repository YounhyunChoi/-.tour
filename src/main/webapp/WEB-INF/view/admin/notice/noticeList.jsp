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
<title>ADMIN.NOTICE.01 공지 목록</title>
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
                    <h1 class='text-center pt-3 text-white'><b>공지사항</b></h1>
                </div>
            </div>
        </div>
    </div>
   <div class='row'>
        <div class='col'>
            <div class='navigation fixed-top pt-2' id='subHeader'>
                <h6 class='text-white p-2'>
                    <a href='../main.html'>메인</a> > <a href='./01.html'>공지사항</a>
                </h6>
            </div>
        </div>
    </div>
</header>
<div class='row' id='mainBody'>
   <div class='col'>
        <form class='mb-4'>
            <div class='row'>
                <div class='col-6 pt-2'>
                    <input type='text' class='form-control'/>
                </div>
                <div class='col'>
                    <a href='#' type='button' class='btn'><i class='icon bi bi-search'></i></a>
                </div>
                <div class='col'>
                    <div class='d-flex justify-content-end'>
                        <button type='button' class='btn btn-darkBlue' onclick="location.href='./02.html'">
                            <i class='bi bi-plus-circle'></i>&nbsp;새글
                        </button>
                    </div>
                </div>
            </div>
        </form>
        <div class='row'>
            <div class='col'>
                <table class='table table-bordered table-sm'>
                    <thead class='table-lightGray text-center'>
                        <th></th>
                        <th>No</th>
                        <th>제목</th>
                        <th>내용</th>
                        <th>작성일</th>
                    </thead>
                    <tbody class='text-center'>
                        <tr>
                            <td><input type='radio' name='noticeHeader'/></td>
                            <td>5</td>
                            <td>시스템 점검</td>
                            <td>시스템 점검 공지사항 내용</td>
                            <td>2023-02-12</td>
                        </tr>
                        <tr>
                            <td><input type='radio' name='noticeHeader'/></td>
                            <td>4</td>
                            <td>시스템 오류</td>
                            <td>시스템 오류 공지사항 내용</td>
                            <td>2023-01-26</td>
                        </tr>
                        <tr>
                            <td><input type='radio'name='noticeHeader' /></td>
                            <td>3</td>
                            <td>화불지연 공지</td>
                            <td>화불지연 공지사항 내용</td>
                            <td>2022-12-02</td>
                        </tr>
                        <tr>
                            <td><input type='radio' name='noticeHeader'/></td>
                            <td>2</td>
                            <td>시스템 업로드 공지</td>
                            <td>시스템 업로드 공지사항 내용</td>
                            <td>2022-11-14</td>
                        </tr>
                        <tr>
                            <td><input type='radio' name='noticeHeader'/></td>
                            <td>1</td>
                            <td>시스템 점검</td>
                            <td>시스템 점검 공지사항 내용</td>
                            <td>2022-09-23</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class='d-flex justify-content-end'>
                <button type='button' class='btn btn-olive' onclick="location.href='./03.html'">
                    <i class='bi bi-check-circle'></i>
                    &nbsp;수정
                </button>
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
   </div>
</div>
<footer>
</footer>
</body>
</html>