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
<link href='/res/style.css' rel='stylesheet'/>
<script src='../res/navigation.js'></script>
<script src='../res/modal.js'></script>
<script>
let addComma = function(component, value){
	component.text(Number(value).toLocaleString('en').split(".")[0])
}

function addWish() {
	$.ajax({
		url: '../wish/add',
		method: 'post',
		data: {
			tourNum: ${param.tourNum}
		},
		success: showOkModal('여행코스가 찜 되었습니다.')
	})
}

$(() => {
	//여행코스 이미지
	$.ajax({
		url: 'getTourImages',
		method: 'get',
		data: {
			tourNum: ${param.tourNum}
		},
		dataType: 'json',
		success: tourImages => {
			const tourArr = []
			
			if(!tourImages.length) {
  				$('.tourCarouselBtn').hide()
  			} else if(tourImages.length != 1) {
				$.each(tourImages, (i, tourImage) => {
					if(i == 0) {
						tourArr.push(
							`<div class='carousel-item active'">
		                        <img src='<c:url value="/attach/` + tourImage + `"/>' style="max-width:100%; height:100%;"/>
		                    </div>`)
					} else {
						tourArr.push(
							`<div class='carousel-item'">
		                        <img src='<c:url value="/attach/` + tourImage + `"/>' style="max-width:100%; height:100%;"/>
		                    </div>`)
					}
				})
  			} else {
  				$('.tourCarouselBtn').hide()
  				
  				tourArr.push(`<img src='<c:url value="/attach/` + tourImages[0] + `"/>' style="max-width:100%; height:100%;"/>`)
  			}
			$('#tourImgIn').append(tourArr.join(''))
		}
	})
	
	//여행코스 조회
	$.ajax({
		url: 'get',
		success: tours => {
			const tourArr = []
			let tourEDate
			$.each(tours, (i, tour) => {
				if(tour.tourNum == ${param.tourNum}) {
					$('#tourTitle').append(`\${tour.tourName}`)
					tourEDate = tour.tourEDate
					tourArr.push(
							`<div class='ms-3'>
								<div class='d-block'>
									<span><h5><b>\${tour.tourName}</h5></b></span>
								</div>
								<div class='d-block'>
									기간:
									<span>\${tour.tourSDate} ~ \${tour.tourEDate}</span>
								</div>
								<div class='d-block'>
									가격:
									<span id='tourPrice'>\${tour.tourPrice - tour.discountPrice}</span>
								</div>
								<div class='d-block'>
									내용:
									<span>\${tour.tourContent}</span>
								</div>
							</div>`)
					$('#tourContent').append(tourArr.join(''))
				}
			})
			
			addComma($('#tourPrice'), $('#tourPrice').text())
			
			$('#reservationBtn').click(e => {	
				if(`${userId}`){
					$.ajax({
						url: '../reservation/get',
						success: reservations => {
							let msg
							$.each(reservations, (i, reservation) => {
								if(${param.tourNum} == reservation.tourNum && reservation.whetherToCancel == 'N' && tourEDate == reservation.resvEDate){
									msg = '이미 예약한 코스입니다.'
								}			
							})
							if(msg) {
								showOkModal(msg);
							} else {
								location.href=`../reservation/add?tourNum=${param.tourNum}`
							}
						}
					})
				}else{
					showOkModal('로그인페이지로 이동합니다.', '../user/login')
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
		if('${userId}' != '') {
			$.ajax({
				url: '../wish/get',
				success: wishes => {
					if(wishes.length) {
						let result = []
						
						$.each(wishes, (i, wish) => {
							result = wishes.filter(wish => ${param.tourNum} == wish.tourNum);
						})
						
						if(result.length) {
							showOkModal('이미 찜한 여행코스입니다.')
						} else {
							addWish()
						}
					} else {
						addWish()
					}
				}
			})
       	} else {
       		location.href = '../user/login'
       	}
	})
	
	//리뷰 리스트
	$.ajax({
		url: 'getReviews',
		dataType: 'json',
		success: reviews => {
			if(reviews.length) {
				const reviewArr = []
				
				$.each(reviews, (i, review) => {
					if(review.userId != `${userId}`) {
						reviewArr.push(`
							<div class='row mx-2 mt-5 shadow-sm border'>
								<div class='col'>
						            <div class='row align-items-center border-bottom'>
						                <div class='col-4 fs-6'>후기번호
						                	<span class='reivewNum'>\${review.reviewNum}</span>
						                </div>
						                <div class='col fs-5'>\${review.tourName}</div>
						            </div>
						            <div class='row mt-2'>
						                <div class='col-4'>
						                    <img class='rounded-1 shadow-sm reviewImage' src='<c:url value="/attach/` + review.reviewImageName + `"/>' id='\${review.userId}' style="max-width:100%; height:100%;"/>
						                </div>
						                <div class='col-6 ms-2 fs-5 text-left'>
						                    <p class='m-0'>제목: \${review.reviewTitle}</p>
						                    <p class='m-0' id='score\${review.userId}'></p>
						                    <p class='m-0'>\${review.userId}</p>
						                </div>
						            </div>
						            <div class='row'>
						                <p class='text-end'>
						                    작성일 \${review.reviewDate}
						                </p>
						            </div>
						        </div>
					        </div>
						`)
					} else {
						reviewArr.push(`
							<div class='row mx-2 mt-5 shadow-sm border'>
								<div class='col'>
						            <div class='row align-items-center border-bottom'>
						                <div class='col-4 fs-6'>후기번호
						                	<span class='reivewNum'>\${review.reviewNum}</span>
						                </div>
						                <div class='col fs-5'>\${review.tourName}</div>
						            </div>
						            <div class='row mt-2'>
						                <div class='col-4'>
						                	<img class='rounded-1 shadow-sm reviewImage' src='<c:url value="/attach/` + review.reviewImageName + `"/>' id='\${review.userId}' style="max-width:100%; height:100%;"/>
						                </div>
						                <div class='col-6 ms-2 fs-5 text-left'>
						                    <p class='m-0'>제목: \${review.reviewTitle}</p>
						                    <p class='m-0' id='score\${review.userId}'></p>
						                    <p class='m-0'>\${review.userId}</p>
						                </div>
						            </div>
						            <div class='row'>
						                <p class='text-end'>
						                    작성일: \${review.reviewDate}
						                </p>
						            </div>
					            </div>
				            </div>
						`)
					}
				})
				$('#reviewContainer').append(reviewArr.join(''))
				
				//평점 별 아이콘 변환
				$.each(reviews, (i, review) => {
					let scorehtml = '평점: '
	
					for(let i = 0; i < 5; i++) {
						if(review.score - i >= 1) {
							scorehtml += `<i class='bi bi-star-fill'></i>`
						} else if(review.score - i == 0.5) {
							scorehtml += `<i class='bi bi-star-half'></i>`
						} else {
							scorehtml += `<i class='bi bi-star'></i>`
						}
					}
					
					$(`#score\${review.userId}`).html(scorehtml)
					
					for(let i = 0; i < $('.reivewNum').length; i++){
						$('.reivewNum').eq(i).text($('.reivewNum').eq(i).text().padStart(4, '0'))
					}
				})
				
				//리뷰 클릭시 이동
				$.each(reviews, (i, review) => {
					$(`#\${review.userId}`).click(() => {
						location.href = `../review/view?reviewNum=\${review.reviewNum}`
					})
				})
			} else {
				$('#reviewContainer').append(`<div class='text-center fs-3'>등록된 후기가 없습니다.</div>`)
			}
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
<header></header>
<div class='navigation fixed-top'>
    <div class='float-start mt-3 ms-2'>
    	<i class='bi bi-chevron-left' id='historyBtn'></i>
    </div>
    <div class='menuName'>
        <h2 class='text-center pt-3'><b id='tourTitle'></b></h2>
    </div>
</div>
<div class='container'>
    <div class='row'>
        <div class='col'>
            <div class='row py-4 mt-4' id='tourImg'>
                <div class='carousel slide' id='tourCarousel' data-ride='carousel'>
                    <div class='carousel-inner' id='tourImgIn'>
                    	<!-- 여행코스 이미지 -->
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
                <a id='tourShareBtn' class='bi bi-share-fill ms-5 btn tourShareIcon'></a>
                <a id='tourWishBtn' class='bi bi-heart ms-3 btn tourWishIcon'></a>
            </div>
            <div class='row'>
                <button type='button' id='reservationBtn' class='mt-5 ms-5 w-auto btn btn-darkBlue'>
                    예약하기
                </button>
            </div>
        </div>
    </div>
    <div id='reviewContainer'>
	        <!-- 리뷰 리스트 -->
    </div>
</div>
<footer></footer>
</body>
</html>