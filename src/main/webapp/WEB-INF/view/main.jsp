<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
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
	
	$.ajax({
		url: 'notice/get',
		dataType: 'json',
		success: notices => {
			if(notices.length) {
				$('#noticeBar').html('<h4 class="mt-3">' + notices.at(0).noticeTitle + '</h4>')
				$('#noticeBar').attr('href', 'notice/view?noticeNum=' + notices.at(0).noticeNum)
			} else {
				$('#noticeBar').html('<h4 class="text-center">공지사항</h4>')
			}
			
		}
	})
	
	$.ajax({
		url: 'event/get',
		dataType: 'json',
		success: events => {
			if(events.length) {
				$.ajax({
					url: 'event/getEventImage',
					data: {
						eventNum: events.at(0).eventNum
					},
					dataType: 'json',
					success: eventImage => {
						$('#eventImg div').html(`<img src='<c:url value="/attach/\${eventImage.at(0)}"/>'/>`)
						$('#eventImg').click(() => {
							$(location).attr('href', 'event/view?eventNum=' + events.at(0).eventNum)
						})
					}
				})
			} else {
				$('#eventImg div').html('이벤트이미지')
			}
			
		}
	})
	
	$.ajax({
		url: 'tour/get',
		dataType: 'json',
		success: tours => {
			if(tours.length) {
				$.ajax({
					url: 'tour/getTourImages',
					data: {
						tourNum: tours.at(0).tourNum
					},
					dataType: 'json',
					success: tourImage => {
						$('#tourImg div').html(`<img src='<c:url value="/attach/\${tourImage.at(0)}"/>'/>`)
						$('#tourImg').click(() => {
							$(location).attr('href', 'tour/view?tourNum=' + tours.at(0).tourNum)
						})
					}
				})
			} else {
				$('#tourImg div').html('여행코스이미지')
			}
		}
	})
})
</script>
<title>메인</title>
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
        <p><a id='noticeBar' class='text-center'></a></p>
    </div>
</div>
<div class='row m-0'>
    <div class='col'>
        <div class='row py-5 mt-4' id='eventImg'>
        	<div class='py-5 fs-4'>이벤트이미지</div>
        </div>
    </div>
</div>
<div class='row m-0'>
    <div class='col'>
        <div class='row mt-4' id='tourImg'>
        	<div class='py-5 fs-4'>여행코스이미지</div>
        </div>
    </div>
</div>
<footer></footer>
</body>
</html>