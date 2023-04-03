<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<html>
<head>
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
        sessionStorage.setItem("userId", "java01")
    })
</script>

<title>NOTICE.02 공지 조회</title>
<style>
    .noticeName{
        color: black;
   }

   .noticeImg{
        padding:5rem;
   }
</style>
</head>
<body>
<header>
</header>
<div class='navigation fixed-top'>
   <div class='float-start mt-3 ms-2'><i class='bi bi-caret-left-fill' onclick="location.history()"></i></div>
   <div class='menuName'>
      <h2 class='text-center pt-3'><b>공지상세</b></h2>
   </div>
</div>
<div class='container'>
    <div class='row mt-5'>
        <h3 class='noticeName'><b>3. [공지] 설 연휴 일정 변경 안내</b></h3>
        <span class='col noticeContent'>
            <p>작성일 2023-01-16</p>
        </span>
        <hr>
        <div class='border text-center mb-3 noticeImg'>공지사항이미지</div>
        <span>설 연휴에 따른 여행 일정 변경 안내드립니다. 
            우리 고유 명절인 설을 맞이하면 신청한 택배가 배송지연될 수 있음을 안내드립니다...
        </span>
    </div>
</div>
<footer>
</footer>
</body>
</html>