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
<title></title>
<script>
let changeToDate = function(date){
	date = date.replaceAll('-', '')
	let year = date.slice(0,4)
	let month = date.slice(5,6) - 1
	let day = date.slice(7,8)
	return new Date(year, month, day)
}

$.ajax({
	url: 'get',
	dataType: 'json',
	success: reservations => {
		let presentDate = new Date()
		let tourEDate
		
		if(reservations.length) {
			const reservationArr = []
			$.ajax({
				url: '../reservation/tours',
				dataType: 'json',
				success: tours => {	
					$.each(reservations, (i, reservation) => {
						$.each(tours, (i, tour) => {	
							if(reservation.tourNum == tour.tourNum){
								reservationArr.push(
								`
									<div class='row mt-4 d-flex flex-column shadow-sm border border-1'>
								        <div class='col p-2 border-bottom'>
								            <div class='row align-items-center'>	
								                <div class='col-8 fs-6 tourDate'>여행기간:\${tour.tourSDate} ~ \${tour.tourEDate}</div>
								                <div class='col-4 text-end'>
								                    <button type='button' id=tourViewBtn\${tour.tourNum} class='border-0 bg-white'>
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
								                        <p class='mb-1 resvNum'>\${reservation.resvNum}</p>
								                        <div class='d-flex image'>
								                            <span>여행코스이미지</span>
								                        </div>
								                    </div>
								                </div>
								                <div class='col-5 fs-5'><b>\${tour.tourName}</b></div>
								                <div id='resvBtnContainer\${reservation.tourNum}' class='col-3 d-flex align-self-end'>									                   
								                </div>
								            </div>
								        </div>
								    </div>
								`
								)
							}
						})
					})
					$('#reservationContainer').append(reservationArr.join(''))
					for(let i =0; i < $('.resvNum').length; i++){
						$('.resvNum').eq(i).text($('.resvNum').eq(i).text().padStart(4, '0'))
					}
					$.each(tours, (i, tour) => {
						console.log(presentDate.getTime(), changeToDate(tour.tourEDate).getTime())
						if(presentDate.getTime() > changeToDate(tour.tourEDate).getTime()){						
							$(`#resvBtnContainer\${tour.tourNum}`).html(
								`<button type='button' id='reviewAddBtn\${tour.tourNum}'
		                        class='border border-0 rounded text-white reviewAddBtn'>후기등록</button>`
		                        )
							}
						$(`#reviewAddBtn\${tour.tourNum}`).click(() => {location.href=`../review/add?tourNum=\${tour.tourNum}`})
						$(`#tourViewBtn\${tour.tourNum}`).click(() => {location.href=`../tour/view?tourNum=\${tour.tourNum}`})
					}) 
				}	
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
    <div class='float-start mt-2 ms-2'><i class='bi bi-caret-left-fill' onclick="location.href='../user/mypage.html'"></i></div>
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