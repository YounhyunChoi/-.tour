<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
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
$(() => {
	//여행코스 값을 폼에 불러오기
	$.ajax({
		url: 'get',
		success: tours => {
			$.each(tours, (i, tour) => {
				if(tour.tourNum == ${param.tourNum}) {
					$('#tourName').val(`\${tour.tourName}`)
					$('#tourSDate').val(`\${tour.tourSDate}`)
					$('#tourEDate').val(`\${tour.tourEDate}`)
					$('#tourPrice').val(`\${tour.tourPrice}`)
					$('#tourContent').val(`\${tour.tourContent}`)
				}
			})
		}
	})
	
	//여행코스 수정
	$('#tourFixBtn').click(() => {
		if($('#tourName').val() && $('#tourSDate').val() &&
				$('#tourEDate').val() && $('#tourPrice').val() && $('#tourContent').val()) {
			showConfirmModal('여행코스를 수정하시겠습니까?', '여행코스가 수정되었습니다.', '../tour/adminList')
			
			$('#okBtn').click(() => {
				let tour = {
					tourNum: ${param.tourNum},
					tourName: $('#tourName').val(),
					tourContent: $('#tourContent').val(),
					tourSDate: $('#tourSDate').val(),
					tourEDate: $('#tourEDate').val(),
					tourPrice: $('#tourPrice').val(),
					adminId: `${adminId}`,
					termNum: 1
				}
				
				$.ajax({
					url: '../tour/fixTour',
					method: 'put',
					contentType: 'application/json',
					data: JSON.stringify(tour)
				})
			})
		} else {
			showOkModal('필수 입력사항을 채워주세요.')
		}
	})
	
	//여행코스 삭제
	$('#tourDelBtn').click(() => {
		showConfirmModal('여행코스를 삭제하시겠습니까?', '여행코스가 삭제되었습니다.', '../tour/adminList')
		
		$('#okBtn').click(() => {
			$.ajax({
				url: '../tour/del/' + `${param.tourNum}`,
				method: 'delete'
			})
		})
    })
})
</script>
<title>상품수정</title>
<style>
    #tourImg {
        border: .1rem solid;
        margin: 1rem;
        box-shadow: .1rem .1rem .1rem .1rem lightgray;
        text-align: center;
    }

    .tourCarouselBtn {
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
		           			<a href='../admin/main'>
	                    		<img src='<c:url value="/attach/${logoName}"/>' id='logo'/>
	                    	</a>
                    	</div>
					</c:if>
					<c:if test='${logoName == null}'>
						<div class='float-start m-4 ms-4'>
							<a  class='border border-dark text-white p-2 mt-1' href='../admin/main' id='logo'>
								로고이미지
							</a>
						</div>
					</c:if>
                    <h1 class='text-center pt-3 text-white'><b>상품수정</b></h1>
                </div>
            </div>
        </div>
    </div>
   <div class='row'>
        <div class='col'>
            <div class='navigation fixed-top pt-2' id='subHeader'>
                <h6 class='text-white p-2'>
                    <a href='../main.html'>메인</a> > <a href='./01.html'>상품목록</a> > <a href='./03.html'>상품수정</a>
                </h6>
            </div>
        </div>
    </div>
</header>
<div class='row' id='mainBody'>
    <div class='col'>
        <div class='row'>
            <div class='col-6'>
                <div class='row py-5 mt-4' id='tourImg'>
                    <div class='carousel slide py-5' id='tourCarousel' data-ride='carousel'>
                        <div class='carousel-inner'>
                            <div class='carousel-item active'>
                                <div class='items'>
                                	<img src='<c:url value="#"/>'/>
                                </div>
                            </div>
                        </div>
                        <a href='#tourCarousel' class='carousel-control-prev' data-bs-slide='prev'>
                            <i class='bi bi-chevron-left tourCarouselBtn'></i>
                            <div class='visually-hidden'>Previous</div>
                        </a>
                        <a href='#tourCarousel' class='carousel-control-next' data-bs-slide='next'>
                            <i class='bi bi-chevron-right tourCarouselBtn'></i>
                            <div class='visually-hidden'>Next</div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class='row'>
            <div class='col'>
            	<form id='tourImageUp'>
					<input type='file' name='tourImage' id='tourImage' accept='image/*' multiple/>
				</form>
            </div>
        </div>
        <form>
            <div class='row mt-2 align-items-center'>
                <div class='col-1 text-end text-nowrap fs-5'>
                    제목
                </div>
                <div class='col-8'>
                    <input type='text' class='form-control' id='tourName'/>
                </div>
            </div>
            <div class='row mt-2 align-items-center'>
                <div class='col-1 text-end text-nowrap fs-5'>
                    기간
                </div>
                <div class='col-4'>
                    <input type='date' class='form-control' id='tourSDate'/>
                </div>
                	~
                <div class='col-4'>
                    <input type='date' class='form-control' id='tourEDate'/>
                </div>
            </div>
            <div class='row mt-2 align-items-center'>
                <div class='col-1 text-end text-nowrap fs-5'>
                    가격
                </div>
                <div class='col-8'>
                    <input type='text' class='form-control' id='tourPrice'/>
                </div>
            </div>
            <div class='row mt-2'>
                <div class='col-1 text-end text-nowrap fs-5'>
                    내용
                </div>
                <div class='col-8'>
                    <textarea class='form-control' rows='10' id='tourContent'></textarea>
                </div>
            </div>
            <div class='row justify-content-end me-5 mt-2'>
                <div class='col-4 d-flex flex-nowrap align-self-center'>
                    <button id='tourFixBtn' type='button' class='btn btn-olive' data-bs-toggle='modal' data-bs-target='#modal'>
                        <span class='bi bi-check-circle text-nowrap'>&nbsp;수정</span>
                    </button>
                    <button id='tourDelBtn' type='button' class='btn btn-lightRed ms-2' data-bs-toggle='modal' data-bs-target='#modal'>
                        <span class='bi bi-x-circle text-nowrap'>&nbsp;삭제</span>
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
<footer>
</footer>
</body>
</html>