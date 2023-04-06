<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css' rel='stylesheet'/>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'/>
<link href='https://getbootstrap.com/docs/5.3/assets/css/docs.css' rel='stylesheet'/>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<link href='/res/style.css' rel='stylesheet'/>
<script src='/res/navigation.js'></script>
<script src='/res/modal.js'></script>
<script>
function addWish() {
	$.ajax({
		url: '../wish/add',
		method: 'post',
		contentType: 'application/json',
		data: JSON.stringify({
			tourNum: ${param.tourNum}
		}),
		success: showOkModal('여행코스가 찜 되었습니다.')
	})
}

$(() => {
	$.ajax({
		url: 'get',
		success: tours => {
			const tourArr = []

			$.each(tours, (i, tour) => {
				if(tour.tourNum == ${param.tourNum}) {
					$('#tourTitle').append(`\${tour.tourName}`)
					
					tourArr.push(
							`<div class='ms-3'>
								\${tour.tourName}<br>
								기간 \${tour.tourSDate} ~ \${tour.tourEDate}<br>
								가격 \${tour.tourPrice}<br>
								내용 \${tour.tourContent}<br>
							</div>`)
					$('#tourContent').append(tourArr.join(''))
				}
			})
		}
	})
	
	//여행코스 공유
	$('#tourShareBtn').click(() => {
		let url = ''
		let textarea = document.createElement("textarea")
		document.body.appendChild(textarea)
		url = window.document.location.href
		textarea.value = url
		textarea.select()
		document.execCommand("copy")
		document.body.removeChild(textarea)
	
		showOkModal('링크가 복사되었습니다. 친구에게 공유해보세요.')
	})

	//여행코스 찜
	$('#tourWishBtn').click(() => {
		if(!${userId}) {
			$.ajax({
				url: '../wish/get',
				success: wishes => {
					if(wishes.length) {
						$.each(wishes, (i, wish) => {
							let result = wishes.filter(wish => ${param.tourNum} == wish.tourNum);

							if(result.length) {
								showOkModal('이미 찜한 여행코스입니다.')
							} else {
								addWish()
								result = []

})
</script>	
<script>
    $(() => {
    	if(`<%= (String)session.getAttribute("userId") %>` != `null`) {
		   			$.ajax({
					url: '../reservation/get',
					success: reservations => {
						$.each(reservations, (i, reservation) => {
							if((reservation.tourNum == ${param.tourNum}) && (reservation.userId == `<%= (String)session.getAttribute("userId") %>`)) {		
				    			$('#reservationBtn').click(() => {

				    				showOkModal('예약하신 여행코스입니다.')
				    				})
							}
						})
					}
					})		
    		
		} else {
			$('#reservationBtn').click(() => {
				showOkModal('로그인 페이지로 이동합니다.', '../user/login')
			})

       	}
	 	
        $('#tourShareBtn').click(() => {
	        let url = ''
	    	let textarea = document.createElement("textarea")
	    	document.body.appendChild(textarea)
	    	url = window.document.location.href
	    	textarea.value = url
	    	textarea.select()
	    	document.execCommand("copy")
	    	document.body.removeChild(textarea)
	    	
        	showOkModal('링크가 복사되었습니다. 친구에게 공유해보세요.')
        })
        
        $('#tourWishBtn').click(() => {
			if(`<%= (String)session.getAttribute("userId") %>`) {
				$.ajax({
					url: '../wish/get',
					success: wishes => {
						if(wishes.length) {
							$.each(wishes, (i, wish) => {
								let result = wishes.filter(wish => ${param.tourNum} == wish.tourNum);

								if(result.length) {
									showOkModal('이미 찜한 여행코스입니다.')
								} else {
									addWish()
								}
							})
						} else {
							addWish()
						}
					}
				})
        	} else {
				showOkModal('로그인 페이지로 이동합니다.', '../user/login')
        	}
        })
    })
</script>
<title>TOUR.02 여행코스 조회</title>
<style>
    #navBackBtn {
        cursor: pointer;
    }

    #tourImg {
        border: .1rem solid;
        margin: 1rem;
        box-shadow: .1rem .1rem .1rem .1rem lightgray;
        text-align: center;
    }

    .tourCarouselBtn {
        color: black;
    }

    .tourShareIcon {
        font-size: 1.5rem;
        color: #287094;
    }

    .tourWishIcon {
        font-size: 1.5rem;
        color: #ee133b;
    }
</style>
</head>
<body>
<header>
</header>
<div class='navigation fixed-top'>
    <div class='float-start mt-3 ms-2'><i class='bi bi-caret-left-fill' id='navBackBtn' onclick="location.href='../../tour'"></i></div>
    <div class='menuName'>
        <h2 class='text-center pt-3'><b id='tourTitle'></b></h2>
    </div>
</div>
<div class='container'>
    <div class='row'>
        <div class='col'>
            <div class='row py-5 mt-4' id='tourImg'>
                <div class='carousel slide' id='tourCarousel' data-ride='carousel'>
                    <div class='carousel-inner'>
                        <div class='carousel-item active'>
                            <div class='items py-5'>여행코스이미지</div>
                        </div>
                        <div class='carousel-item'>
                            <div class='items py-5'>여행코스이미지</div>
                        </div>
                        <div class='carousel-item'>
                            <div class='items py-5'>여행코스이미지</div>
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
    <div class='row'>
        <div class='col-8' id='tourContent'>
			
        </div>
        <div class='col-4'>
            <div class='row'>
                <i id='tourShareBtn' data-bs-toggle='modal' data-bs-target='#modal' class='bi bi-share-fill ms-5 btn tourShareIcon'></i>
                <i id='tourWishBtn' data-bs-toggle='modal' data-bs-target='#modal' class='bi bi-heart ms-3 btn tourWishIcon'></i>
            </div>
            <div class='row'>

                <button type='button' id='reservationBtn' class='mt-5 ms-5 w-auto btn btn-darkBlue'
                	onclick="location.href=`../reservation/add?tourNum=${param.tourNum}`">
                    예약하기
                </button>

            </div>
        </div>
    </div>
    <div class='row mx-2 mt-5 shadow-sm border'>
        <div class='col'>
            <div class='row align-items-center border-bottom'>
                <div class='col-4 fs-6'>후기번호 0002</div>
                <div class='col fs-5'>도심 속 우리의 역사와 예술이야기</div>
            </div>
            <div class='row mt-2'>
                <div class='col-4'>
                    <!-- 남이 쓴 review일 경우의 링크 -->
                    <div class='reviewImage' onclick="location.href='#'">후기이미지</div>
                </div>
                <div class='col-6 ms-2 fs-5 text-left'>
                    제목 이쁘다<br>
                    평점 ★★★★★
                    <br>java01
                </div>
            </div>
            <div class='row'>
                <p class='text-end'>
                    작성일 2023-02-25
                </p>
            </div>
        </div>
    </div>
    <div class='row mx-2 mt-5 shadow-sm border'>
        <div class='col'>
            <div class='row align-items-center border-bottom'>
                <div class='col-4 fs-6'>후기번호 0001</div>
                <div class='col fs-5'>도심 속 우리의 역사와 예술이야기</div>
            </div>
            <div class='row mt-2'>
                <div class='col-4'>
                    <!-- 내가 쓴 review일 경우의 링크 -->
                    <div class='reviewImage' onclick="location.href='#'">후기이미지</div>
                </div>
                <div class='col-6 ms-2 fs-5 text-left'>
                    제목 안녕하세요<br>
                    평점 ★★★★★
                    <br>java02
                </div>
            </div>
            <div class='row'>
                <p class='text-end'>
                    작성일 2023-02-17
                </p>
            </div>
        </div>
    </div>
</div>
<footer>
</footer>
</body>
</html>