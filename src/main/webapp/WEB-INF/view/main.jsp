<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'/>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css' rel='stylesheet'/>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'/>
<link href='https://getbootstrap.com/docs/5.3/assets/css/docs.css' rel='stylesheet'/>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<link href='res/style.css' rel='stylesheet'/>
<script src='res/navigation.js'></script>
<script>
$(() => {
        $('header').html($('header').html().replaceAll('../', ''))
        $('footer').html($('footer').html().replaceAll('../', ''))
    })
</script>
  <title>main</title>
<style>
    #mainBody { 
    padding-top: 60px;
    }
    
    #noticeBar{
        color:white
    }
    #navBackBtn {
        cursor: pointer;
    }
    #tourImg, #eventImg {
        border: .1rem solid;
        margin: 1rem;
        box-shadow: .1rem .1rem .1rem .1rem lightgray;
        text-align: center;
    }
    #tourImg{
        padding: 10rem 0 10rem 0;
    }
    .tourCarouselBtn {
        color: black;
    }
</style>
</head>
<body id='mainBody'>
<header></header>
<div class='row m-0 bg-danger'>
    <div class='col pt-1'>
        <p><a href='./notice/02.jsp' id='noticeBar'><h4 class='text-center'>공지사항</h4></a></p>
    </div>
</div>
<div class='row m-0'>
    <div class='col'>
        <div class='row py-5 mt-4' id='eventImg'>
            <div class='carousel slide' id='tourCarousel' data-ride='carousel'>
                <div class='carousel-inner'>
                    <div class='carousel-item active' onclick="location.href='./event/02.jsp'">
                            <div class='items py-5 fs-4'>이벤트이미지</div>
                    </div>
                    <div class='carousel-item' onclick="location.href='./event/02.jsp'">
                        <div class='items py-5 fs-4'>이벤트이미지</div>
                    </div>
                    <div class='carousel-item' onclick="location.href='./event/02.jsp'">
                        <div class='items py-5 fs-4'>이벤트이미지</div>
                    </div>
                </div>
                <a href='#tourCarousel' class='carousel-control-prev' data-bs-slide='prev'>
                    <i class="bi bi-chevron-left tourCarouselBtn"></i>
                    <div class="visually-hidden">Previous</div>
                </a>
                <a href='#tourCarousel' class='carousel-control-next' data-bs-slide='next'>
                    <i class="bi bi-chevron-right tourCarouselBtn"></i>
                    <div class="visually-hidden">Next</div>
                </a>
            </div>
        </div>
    </div>
</div>
<div class='row m-0'>
    <div class='col'>
        <div class='row mt-4' id='tourImg'>
            <div class='carousel slide' id='tourCarousel2' data-ride='carousel'>
                <div class='carousel-inner'>
                    <div class='carousel-item active' onclick="location.href='./tour/02.jsp'">
                        <div class='items py-5 fs-4'>여행코스이미지</div>
                    </div>
                    <div class='carousel-item' onclick="location.href='./tour/02.jsp'">
                        <div class='items py-5 fs-4' >여행코스이미지</div>
                    </div>
                    <div class='carousel-item' onclick="location.href='./tour/02.jsp'">
                        <div class='items py-5 fs-4'>여행코스이미지</div>
                    </div>
                </div>
                <a href='#tourCarousel2' class='carousel-control-prev' data-bs-slide='prev'>
                    <i class="bi bi-chevron-left tourCarouselBtn"></i>
                    <div class="visually-hidden">Previous</div>
                </a>
                <a href='#tourCarousel2' class='carousel-control-next' data-bs-slide='next'>
                    <i class="bi bi-chevron-right tourCarouselBtn"></i>
                    <div class="visually-hidden">Next</div>
                </a>
            </div>
        </div>
    </div>
</div>
<footer></footer>
</body>
</html>