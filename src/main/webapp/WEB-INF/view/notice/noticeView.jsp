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
<link href='../res/style.css' rel='stylesheet'/>
<script src='../res/navigation.js'></script>
<script>
$(() => {
	$.ajax({
		url: 'getNotice',
		data: {
			noticeNum: ${param.noticeNum}
		},
		dataType: 'json',
		success: notices => {
			const noticeArr = []
			let notice = notices.at(0)
				noticeArr.push(
			        `<h3 class='noticeName'>
			        	<sapn id='noticeNum'><b>\${notice.noticeNum}.</b></span>
			        	<b>\${notice.noticeTitle}</b>
			        </h3>
			        <span class='col noticeContent'>
			            <p>작성일 \${notice.noticeDate}</p>
			        </span>
			        <hr>
			        <div class='row mb-2' id='cardImg'>
		            	<div class='col'>
		                	<div class='row me-0 py-2' id='noticeImg' style='height: 10rem;'>`)
		  	$.ajax({
		  		url: 'getNoticeImage',
		  		data: {
		  			noticeNum: ${param.noticeNum}
		  		},
		  		dataType: 'json',
		  		success: noticeImages => {
		  			if(!noticeImages.length) {
		  				$(() => {
		  					$('#noticeImg').hide()
		  				})
		  			} else if(noticeImages.length != 1) {
		  				noticeArr.push(`<div class='carousel slide' id='noticeCarousel' data-ride='carousel'>
		                        <div class='carousel-inner noticeImg'>`)
						$.each(noticeImages, (i, noticeImage) => {
							if(i == 1) {
								noticeArr.push(
										`<div class='carousel-item active'">
					                        <img src='<c:url value="/attach/` + noticeImage + `"/>' style="max-width:100%; height:100%;"/>
					                    </div>`)
							} else {
								noticeArr.push(
										`<div class='carousel-item'">
					                        <img src='<c:url value="/attach/` + noticeImage + `"/>' style="max-width:100%; height:100%;"/>
					                    </div>`)
							}
						})
		                noticeArr.push(`</div>
		                        <a href='#noticeCarousel' class='carousel-control-prev' data-bs-slide='prev'>
		                            <i class="bi bi-chevron-left tourCarouselBtn"></i>
		                            <div class="visually-hidden">Previous</div>
		                        </a>
		                        <a href='#noticeCarousel' class='carousel-control-next' data-bs-slide='next'>
		                            <i class="bi bi-chevron-right tourCarouselBtn"></i>
		                            <div class="visually-hidden">Next</div>
		                        </a>
		                    </div>`)                   
		  			} else {
		  				noticeArr.push(`<img src='<c:url value="/attach/` + noticeImages[0] + `"/>' style="max-width:100%; height:100%;"/>`)
		  			}
		  			noticeArr.push(`
	  							</div>
				            </div>
				        </div>
					    <span>\${notice.noticeContent}</span>`)
					$('#noticeView').append(noticeArr.join(''))
		  		}
		  	})
		}
	})
})

</script>
<title>NOTICE.02 공지 조회</title>
<style>
   #noticeImg {
        border: .1rem solid lightgray;
        margin: 1rem;
        text-align: center;
    }

    .tourCarouselBtn {
        color: black;
    }
</style>
</head>
<body>
<header>
</header>
<div class='navigation fixed-top'>
   <div class='float-start mt-3 ms-2'><i class='bi bi-caret-left-fill'></i></div>
   <div class='menuName'>
      <h2 class='text-center pt-3'><b>공지상세</b></h2>
   </div>
</div>
<div class='container'>
    <div class='row mt-5' id='noticeView'>
    </div>
</div>
<footer>
</footer>
</body>
</html>