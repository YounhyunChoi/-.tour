<%@ page language='java' contentType='text/html; charset=UTF-8'  pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
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
<title></title>
<script>
$.ajax({
	url: 'get',
	dataType: 'json',
	success: reservationDtos => {
		let presentDate = new Date()

		if(reservationDtos.length) {
			const resvDtoArr = []
				$.each(reservationDtos, (i, reservationDto) => {
					resvDtoArr.push(
					`
					<div class='row mt-4 d-flex flex-column shadow-sm border border-1'>
				        <div class='col p-2 border-bottom'>
				            <div class='row align-items-center'>	
				                <div class='col-8 fs-6 tourDate'>여행기간:\${reservationDto.tourSDate} ~ \${reservationDto.tourEDate}</div>
				                <div class='col-4 text-end'>
				                    <button type='button' id=tourViewBtn\${reservationDto.tourNum} class='border-0 bg-white'>
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
				                        <span class='d-flex'>예약번호<p class='mb-1 resvNum'>\${reservationDto.resvNum}</p></span>
				                        <div class='d-flex image'>
				                        <img src='<c:url value="/attach/` + reservationDto.tourImageName + `"/>' style="max-width:90%; height:90%;"/>
				                        </div>
				                    </div>
				                </div>
				                <div class='col-5 fs-5'><b>\${reservationDto.tourName}</b></div>
				                <div id='resvBtnContainer\${reservationDto.tourNum}' class='col-3 d-flex align-self-end justify-content-center'
				                	 whetherToCancel=\${reservationDto.whetherToCancel}>									                   
				                </div>
				            </div>
				        </div>
				    </div>
					`
					)					
				})
				$('#reservationContainer').append(resvDtoArr.join(''))
				
				for(let i =0; i < $('.resvNum').length; i++){
					$('.resvNum').eq(i).text($('.resvNum').eq(i).text().padStart(4, '0'))
				}
			
				$.each(reservationDtos, (i, reservationDto) => {
					if($(`#resvBtnContainer\${reservationDto.tourNum}`).attr('whetherToCancel') == 'Y'){
						$(`#resvBtnContainer\${reservationDto.tourNum}`).html(
							`<span
	                        class=' text-danger text-center'>취소됨</span>`
	                        )
					}else if(presentDate.getTime() > new Date(reservationDto.tourEDate).getTime()){						
						$(`#resvBtnContainer\${reservationDto.tourNum}`).html(
								`<button type='button' id='reviewAddBtn\${reservationDto.tourNum}'
		                        class='border border-0 rounded text-white reviewAddBtn'>후기등록</button>`
		                        )
							}
					$.ajax({
						url: 'reviewGet',
						dataType: 'json',
						data:{
							resvNum: reservationDto.resvNum
						},
						success: reviews => {
							if(reviews.length){
								$(`#resvBtnContainer\${reservationDto.tourNum}`).empty()
								$(`#resvBtnContainer\${reservationDto.tourNum}`).html(
									`<span class='text-center'>후기작성완료</span>
			                        ` )
							}
						}
					})	
					$(`#reviewAddBtn\${reservationDto.tourNum}`).click(() => {location.href=`../review/add?tourNum=\${reservationDto.tourNum}&resvNum=\${reservationDto.resvNum}`})
					$(`#tourViewBtn\${reservationDto.tourNum}`).click(() => {location.href=`../tour/view?tourNum=\${reservationDto.tourNum}`})
				})			
		}else {
			$('#reservationContainer').html(`
        			<div class='row d-block my-5'>
                     <div class='col text-center pt-4'>
                         <h3 class='my-3'>
                             예약 내역이 없습니다.
                         </h3>
                     </div>
                     <div class='col text-center mt-5'>
                         <button id='mypageBtn' type='button' class='px-5 py-2 border-0 rounded text-center text-white btn-darkBlue'
                            onclick="location.href='../tour'">
                            여행코스 보러 가기
                         </button>
                     </div>
               </div>
        	`
        	)
		}		
	}
})
</script>
<style>
   .viewDetailBtn {
       font-size: 1.5rem;
   }

   .reviewAddBtn {
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
    <div class='float-start mt-2 ms-2'><i class='bi bi-chevron-left' onclick="location.href='../user/mypage.html'"></i></div>
    <div class='menuName'>
        <h2 class='text-center pt-3'><b>예약내역</b></h2>
    </div>
</div>
<div id='reservationContainer' class='container px-4'>
</div>
<footer>
</footer>
</body>
</html>