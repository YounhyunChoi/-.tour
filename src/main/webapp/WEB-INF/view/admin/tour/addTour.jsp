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
function showTourImages() {
	$.ajax({
		url: 'getTourImages',
		method: 'get',
		dataType: 'json',
		success: tourImages => {
			$.each(tourImages, (i, tourImage) => {
				
				$('img').attr('src', '<c:url value="/attach/' + tourImages.at(0).tourImageName + '"/>')
			})
		}
	})
}

$(() => {
	showTourImages()
	
	$('#tourImageUp').change(() => {
		let formData = new FormData($('#tourImageUp')[0])
		
		$.ajax({
			url: 'addTourImage',
			method: 'post',
			contentType : false,
	        processData : false,  
			data: formData,
			success: showTourImages
		})
	})
})

function showConfirmModal() {
	$('#modalMsg').text('여행코스를 등록하시겠습니까?')
	$('#modalBtn').show()
	$('#modalOk').hide()
	$('#okBtn').click(() => {
		console.log($('#tourName').val())
		
		$.ajax({
			url: '../tour/adminAdd',
			method: 'post',
			contentType: 'application/json',
			data: JSON.stringify({
				tourName: $('#tourName').val(),
				tourContent: $('#tourContent').val(),
				tourSDate: $('#tourSDate').val(),
				tourEDate: $('#tourEDate').val(),
				tourPrice: $('#tourPrice').val(),
				termNum: 1
			})
		}),
		showOkModal('여행코스가 등록되었습니다.', '../tour/adminList')
	})
	$('#modal').modal('show')
}

$(() => {
	$('#tourAddBtn').click(() => {
		if($('#tourName').val() && $('#tourContent').val() && $('#tourSDate').val() && $('#tourEDate').val() && $('#tourPrice').val()) {
			showConfirmModal()
		} else {
			showOkModal('필수 입력사항을 채워주세요.')
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
                    <div class='float-start m-4 ms-4'><a  class='border border-dark text-white p-2 mt-1' href='../main.html' id='logo'>로고이미지</a></div>
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
                        <div class='carousel-inner'>
                            <div class='carousel-item active'>
                                <div class='items'>
                                	<img src='<c:url value="/attach/${tourImageName}"/>'/>
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
					<input type='file' name='tourImage' id='tourImage'/>
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
                <div class='col-2 align-self-center'>
                    <button id='tourAddBtn' type='button' class='btn btn-darkBlue' data-bs-toggle='modal' data-bs-target='#modal'>
                        <span class='bi bi-plus-circle text-nowrap'>&nbsp;등록</span>
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
<div class='modal modal-center fade' id='modal'>
    <div class='modal-dialog modal-smallsize'>
        <div class='modal-content'>
            <div class='pb-4' id='modalMsg'></div>
            <div id='modalBtn'>
                <button type='button' class='btn btn-lightGray' data-bs-dismiss='modal'>아니오</button>
                <button type='button' class='btn btn-darkBlue' id='okBtn'>예</button>
            </div>
            <div id='modalOk'>
                <a type='button' class='btn btn-darkBlue' data-bs-dismiss='modal'>확인</a>
            </div>
        </div>
    </div>
</div>
<footer>
</footer>
</body>
</html>