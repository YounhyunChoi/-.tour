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
function showTourImage() {
	$.ajax({
		url: 'getTourImages',
		method: 'get',
		data: {
			tourNum: ${tourNum}
		},
		dataType: 'json',
		success: tourImages => {
			const tourImageArr = []
			
			if(tourImages.length) {
				$.each(tourImages, (i, tourImageName) => {
					if(i == 0) {
						tourImageArr.push(
								`<div class='carousel-item active'>
			                        <img src='<c:url value="/attach/` + tourImageName + `"/>'style="max-width:100%; height:100%;"/>
			                    </div>`)
					} else {
						tourImageArr.push(
								`<div class='carousel-item'>
			                        <img src='<c:url value="/attach/` + tourImageName + `"/>'style="max-width:100%; height:100%;"/>
			                    </div>`)
					}
				})
			}
			$('#tourImages').empty()
			$('#tourImages').append(tourImageArr.join(''))
		}
	})
}

$(() => {
	//이미지 업로드 시 실행
	$('#tourImage').change(() => {
		let formData = new FormData($('#tourImageUp')[0])

		$.ajax({
			url: 'addTourImages',
			method: 'post',
			contentType: false,
			processData: false,
			data: formData,
			success: showTourImage
		})
	})
	
	//여행코스 등록
	$('#tourAddBtn').click(() => {
		if($('#tourImage').val() && $('#tourName').val() && $('#tourContent').val() &&
						$('#tourSDate').val() && $('#tourEDate').val() && $('#tourPrice').val()) {
			$.ajax({
				url: 'add',
				method: 'post',
				contentType: 'application/json',
				data: JSON.stringify({
					tourName: $('#tourName').val(),
					tourContent: $('#tourContent').val(),
					tourSDate: $('#tourSDate').val(),
					tourEDate: $('#tourEDate').val(),
					tourPrice: $('#tourPrice').val(),
					termNum: 1
				}),
				success: () => {
	    			let formData = new FormData($('#tourImageUp')[0])
	    			
	    			$.ajax({
	    				url: 'addTourImages',
	    				method: 'post',
	    				contentType: false,
	    				processData: false,
	    				data: formData,
	    				success: () => {
	    					$(location).attr('href', 'adminList')
	    				}
	    			})
	    		}
			})
		} else {
			if(!($('#tourName').val().length >= 10)) {
				showOkModal('ERROR] 제목이 10글자 미만입니다.')
			} else if(($('#tourSDate').val().replaceAll('-', '') >= $('#tourEDate').val().replaceAll('-', ''))
					&& $('#tourSDate').val()) {
				showOkModal('ERROR] 여행코스시작일은 여행코스종료일보다 크거나 같을 수 없습니다.')
			} else {
				showOkModal('ERROR] 누락된 필수 입력사항이 있습니다. 확인 후 입력바랍니다.')
			}
		}
	})
})
</script>
<title>상품추가</title>
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
    
	textarea {
		resize: none;
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
                    <h1 class='text-center pt-3 text-white'><b>상품추가</b></h1>
                </div>
            </div>
        </div>
    </div>
   <div class='row'>
        <div class='col'>
            <div class='navigation fixed-top pt-2' id='subHeader'>
                <h6 class='text-white p-2'>
                    <a href='../admin/main'>메인</a> > <a href='../tour/adminList'>상품목록</a> > <a href='../tour/adminAddView'>상품추가</a>
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
                        <div class='carousel-inner' id='tourImages'>
                            <!-- 여행코스 이미지 -->
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
					<input type='file' id='tourImage' name='tourImage' accept='image/*' multiple/>
				</form>
            </div>
        </div>
		<form>
            <div class='row mt-2 align-items-center'>
                <div class='col-1 text-end text-nowrap fs-5'>
                    제목
                </div>
                <div class='col-8'>
                    <input type='text' class='form-control' id='tourName' minlength='10'/>
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
                <div class='col-2 align-self-center'>
                    <a id='tourAddBtn' type='button' class='btn btn-darkBlue'>
                        <span class='bi bi-plus-circle text-nowrap'>&nbsp;등록</span>
                    </a>
                </div>
            </div>
        </form>
    </div>
</div>
<footer>
</footer>
</body>
</html>