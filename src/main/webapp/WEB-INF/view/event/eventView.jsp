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
<script>
$(() => {
	$.ajax({
		url: 'getEvent',
		data: {
			eventNum: ${param.eventNum}
		},
		dataType: 'json',
		success: events => {
			const eventArr = []
			let event = events.at(0)
				eventArr.push(
					`<h3 class='eventName'>
			        	<sapn id='eventNum'><b>\${event.eventNum}.</b></span>
			        	<b>\${event.eventTitle}</b>
			        </h3>
			        <span class='col eventDate'>
			            <p>작성일 \${event.eventDate}</p>
			        </span>
			        <hr>
			        <div class='row mb-2' id='cardImg'>
	            		<div class='col'>
	                		<div class='row me-0 py-2' id='eventImg'>`)
	        $.ajax({
	        	url: 'getEventImage',
	        	data: {
	        		eventNum: ${param.eventNum}
	        	},
	        	dataType: 'json',
	        	success: eventImages => {
	        		if(!eventImages.length){
	        			$(() => {
	        				$('#eventImg').hide()
	        			})
	        		} else if(eventImages.length != 1) {
	        			eventArr.push(
	        					`<div class='carousel slide' id='eventCarousel' data-ride='carousel'>
		                        	<div class='carousel-inner eventImg'>`)
		                $.each(eventImages, (i, eventImage) => {
		                	if(i == 1) {
		                		eventArr.push(
		                				`<div class='carousel-item active'>
				                        	<img src='<c:url value="/attach/` + eventImage + `"/>' style="max-width:100%; height:100%;"/>
				                    	</div>`)
		                	} else {
		                		eventArr.push(
		                				`<div class='carousel-item'>
				                        	<img src='<c:url value="/attach/` + eventImage + `"/>' style="max-width:100%; height:100%;"/>
				                    	</div>`)
		                	}
		                })
		                eventArr.push(`</div>
				                        <a href='#eventCarousel' class='carousel-control-prev' data-bs-slide='prev'>
				                            <i class="bi bi-chevron-left eventCarouselBtn"></i>
				                            <div class="visually-hidden">Previous</div>
				                        </a>
				                        <a href='#eventCarousel' class='carousel-control-next' data-bs-slide='next'>
				                            <i class="bi bi-chevron-right eventCarouselBtn"></i>
				                            <div class="visually-hidden">Next</div>
				                        </a>
				                    </div>`)
	        		} else {
	        			eventArr.push(`<img src='<c:url value="/attach/` + eventImages[0] + `"/>' style="max-width:100%; height:100%;"/>`)
	        		}
	        		eventArr.push(`
	  							</div>
				            </div>
				        </div>
					    <span>\${event.eventContent}</span>`)
					$('#eventView').append(eventArr.join(''))
	        	}
	        })
		}

	})
})
</script>
<script src='../res/navigation.js'></script>
<title>EVENT.02 이벤트 조회</title>
<style>
   #eventImg {
        border: .1rem solid lightgray;
        margin: 1rem;
        text-align: center;
    }

    .eventCarouselBtn {
        color: black;
    }
</style>
</head>
<body>
<header></header>
<div class='navigation fixed-top'>
   <div class='float-start mt-3 ms-2'><i class='bi bi-chevron-left' id='historyBtn' ></i></div>
   <div class='menuName'>
      <h2 class='text-center pt-3'><b>이벤트상세</b></h2>
   </div>
</div>
<div class='container'>
    <div class='row mt-5' id='eventView'>
    </div>
</div>
<footer></footer>
</body>
</html>