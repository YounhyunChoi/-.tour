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
<link href='../../res/adminStyle.css' rel='stylesheet'/>
<script src='../../res/adminNavigation.js'></script>
<script src='../../res/modal.js'></script>
<script>
function showEventImage() {
	$.ajax({
		url: 'getEventImage',
		method: 'get',
		data:{
			eventNum: ${eventNum}
		},
		dataType: 'json',
		success: eventImages => {
			const eventImageArr = []
			if(eventImages.length != 1){
				$('.eventCarouselBtn').show()
				
				$.each(eventImages, (i, eventImage) => {
					if(i == 1){
						eventImageArr.push(
							`<div class='carousel-item active'>
		                        <img src='<c:url value="/attach/` + eventImage + `"/>'style="max-width:100%; height:100%;"/>
		                    </div>`)
					} else {
						eventImageArr.push(
							`<div class='carousel-item'>
		                        <img src='<c:url value="/attach/` + eventImage + `"/>'style="max-width:100%; height:100%;"/>
		                    </div>`)
					}
				})
			} else {
				$('.eventCarouselBtn').hide()
				
				eventImageArr.push(
					`<div class='carousel-item active'>
                        <img src='<c:url value="/attach/` + eventImages[0] + `"/>'style="max-width:100%; height:100%;"/>
                    </div>`)
			}
			$('#eventImages').empty()
			$('#eventImages').append(eventImageArr.join(''))
		}
	})	
}

$(() => {
	$.ajax({
		url: 'getEvent',
		data: {
			eventNum: ${param.eventNum}
		},
		dataType: 'json',
		success: events => {
			let event = events.at(0)
			$('#eventTitle').val(`\${event.eventTitle}`)
			$('#eventContent').val(`\${event.eventContent}`)
		}
	})
	
	showEventImage()
	
	$('#eventImageUp').find('input').change(() => {
		let formData = new FormData($('#eventImageUp')[0])
		$.ajax({
			url: 'addEventImage',
			method: 'post',
			contentType: false,
			processData: false,
			data: formData,
			success: isGood => {
				if(isGood) showEventImage()
				else showOkModal('이미지는 4장까지 등록 할 수 있습니다.')
			}
		})
	})
	
	$('#fixEventBtn').click(() => {
		let regexr = /[가-힣a-zA-Z0-9\s]{5}/
		if(regexr.test($('#eventTitle').val()) && $('#eventContent').val()) {
			$.ajax({
				url: 'fix',
				method: 'put',
				contentType: 'application/json',
				data: JSON.stringify({
					eventNum: ${eventNum},
					eventTitle: $('#eventTitle').val(),
					eventContent: $('#eventContent').val()
				}),
				success: () => {
					$(location).attr('href', 'adminList')
				}
			})
		} else showOkModal('누락된 필수 입력사항이 있습니다. 확인 후 입력바랍니다.')
	})
	
	$('#delEventBtn').click(() => {
		showConfirmModal('이벤트를 삭제하시겠습니까?', 'adminList')
		
		$('#okBtn').click(() => {
			$.ajax({
				url: 'del',
				method: 'delete',
				data: {
					eventNum: `${param.eventNum}`
				}
			})
		})
	})
})
</script>
<title>이벤트수정</title>
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
<header>
<div class='container-fluid'>
    <div class='row'>
        <div class='col'>
            <div class='navigation fixed-top pt-2 pb-3' id='adminHeader'>
            	<c:if test='${logoName != null}'>
            		<div class='float-start ms-4 mt-1' style='height: 50px;'>
            			<a href='../user/adminMain'>
            				<img src='<c:url value="/attach/${logoName}"/>' id='logo'/>
            			</a>
            		</div>
            	</c:if>
            	<c:if test='${logoName == null}'>
					<div class='float-start m-4 ms-4'>
						<a  class='border border-dark text-white p-2 mt-1' href='../user/adminMain' id='logo'>
							로고이미지
						</a>
					</div>
				</c:if>
                <h1 class='text-center pt-3 text-white'><b>이벤트수정</b></h1>
            </div>
        </div>
    </div>
</div>
<div class='row'>
    <div class='col'>
        <div class='navigation fixed-top pt-2' id='subHeader'>
            <h6 class='text-white p-2'>
                <a href='../user/adminMain'>메인</a> > <a href='../event/adminList'>이벤트</a> > <a href=''>이벤트수정</a>
            </h6>
        </div>
    </div>
</div>
</header>
<div class='row' id='mainBody'>
   <div class='col'>
  		<div class='row'>
           <div class='col pt-2 d-flex gap-3 mb-4'>
               <label for='eventTitle'>
                   <h5 class='align-items-center text-nowrap pt-1'>제목</h5>
               </label>
               <div class='col shadow-sm'>
                   <input type='text' class='form-control' id='eventTitle' maxlength='30'/>
               </div>
           </div>
       </div>
       <div class='row ms-4'>
           <div class='col'>
               <div class='row py-5 me-0' id='eventImg'>
                   <div class='carousel slide' id='eventCarousel' data-ride='carousel'>
                       <div class='carousel-inner' id='eventImages'>
							<!-- 이벤트 이미지 -->	
                       </div>
                       <a href='#eventCarousel' class='carousel-control-prev' data-bs-slide='prev'>
                           <i class="bi bi-chevron-left eventCarouselBtn"></i>
                           <div class="visually-hidden">Previous</div>
                       </a>
                       <a href='#eventCarousel' class='carousel-control-next' data-bs-slide='next'>
                           <i class="bi bi-chevron-right eventCarouselBtn"></i>
                           <div class="visually-hidden">Next</div>
                       </a>
                   </div>
               </div>
           </div>
   		<form id='eventImageUp'>
           	<input class='ms-3' type='file' name='eventImage' multiple/>
       </form>	
       </div>
       <div class='row'>
           <div class='col pt-2 d-flex gap-3 mb-4'>
               <label for='eventContent'>
                   <h5 class='align-items-center text-nowrap pt-1'>내용</h5>
               </label>
               <div class='col'>
                   <textarea class='form-control shadow-sm' rows='10' id='eventContent' maxlength='300'></textarea>
               </div>
           </div>
       </div>
       <div class='d-flex gap-2 justify-content-end'>
           <a type='button' class='btn btn-olive'id='fixEventBtn'>
               <i class='bi bi-check-circle'></i>
               &nbsp;수정
           </a>
           <a type='button' class='btn btn-lightRed' id='delEventBtn'>
               <i class='bi bi-x-circle'></i>
               &nbsp;삭제
           </a>
       </div>
   </div>
</div>
<footer></footer>
</body>
</html>