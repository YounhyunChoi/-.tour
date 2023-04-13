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
<title>ADMIN.NOTICE.03 공지 수정</title>
<script>
function showNoticeImage() {
	$.ajax({
		url: 'getNoticeImage',
		method: 'get',
		data: {
			noticeNum: ${noticeNum}
		},
		dataType: 'json',
		success: noticeImages => {
			const noticeImageArr = []
			if(noticeImages.length != 1){
				$('.bi').show()
				
				$.each(noticeImages, (i, noticeImage) => {
					if(i == 1) {
						noticeImageArr.push(
								`<div class='carousel-item active'>
			                        <img src='<c:url value="/attach/` + noticeImage + `"/>'style="max-width:100%; height:100%;"/>
			                    </div>`)
					} else {
						noticeImageArr.push(
								`<div class='carousel-item'>
			                        <img src='<c:url value="/attach/` + noticeImage + `"/>'style="max-width:100%; height:100%;"/>
			                    </div>`)
					}
				})
			} else {	
				$('.bi').hide()
			
				noticeImageArr.push(
						`<div class='carousel-item active'>
	                        <img src='<c:url value="/attach/` + noticeImages[0] + `"/>'style="max-width:100%; height:100%;"/>
	                    </div>`)
			}
			$('#noticeImages').empty()
			$('#noticeImages').append(noticeImageArr.join(''))
		}
	})
}

$(() => {
	$.ajax({
		url: 'getNotice',
		data: {
			noticeNum: ${param.noticeNum}
		},
		dataType: 'json',
		success: notices => {
			let notice = notices.at(0)
			$('#noticeTitle').val(`\${notice.noticeTitle}`)
			$('#noticeContent').val(`\${notice.noticeContent}`)
			
		}
	})
	
	showNoticeImage()
	
		$('#noticeImageUp').find('input').change(() => {
		let formData = new FormData($('#noticeImageUp')[0])	
		$.ajax({
			url: 'addNoticeImages',
			method: 'post',
			contentType: false,
			processData: false,
			data: formData,
			success: isGood => {
				if(isGood) showNoticeImage()
				else showOkModal('이미지는 4장까지 등록 할 수 있습니다.')
			}
		})
	})
	
	$('#fixNoticeBtn').click(() => {
		let regexr = /[가-힣a-zA-Z0-9\s]{5}/
		if(regexr.test($('#noticeTitle').val()) && $('#noticeContent').val()) {
			$.ajax({
				url: 'fix',
				method: 'put',
				contentType: 'application/json',
				data: JSON.stringify({
					noticeNum: ${noticeNum},
					noticeTitle: $('#noticeTitle').val(),
					noticeContent: $('#noticeContent').val()	
				}),
				success: () => {
					$(location).attr('href', 'adminList')
				}
			})
		} else {
			showOkModal('누락된 필수 입력사항이 있습니다. 확인 후 입력바랍니다.')
		}

	})
	//notice삭제
	$('#delNoticeBtn').click(() => {
		showConfirmModal('공지사항을 삭제하시겠습니까?')
		
		$('#okBtn').click(() => {
			$.ajax({
				url: 'del',
				method: 'delete',
				data: {
					noticeNum: `${param.noticeNum}`
				},
				success: () => {
					$(location).attr('href', 'adminList')
				}
			})
		})
		
	})
})
</script>
<style>
    #noticeImg {
        border: .1rem solid lightgray;
        margin: 1rem;
        text-align: center;
    }

    .noticeCarouselBtn {
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
                    <div class='float-start m-4 ms-4'><a  class='border border-dark text-white p-2 mt-1' href='../main.html' id='logo'>로고이미지</a></div>
                    <h1 class='text-center pt-3 text-white'><b>공지수정</b></h1>
                </div>
            </div>
        </div>
    </div>
   <div class='row'>
        <div class='col'>
            <div class='navigation fixed-top pt-2' id='subHeader'>
                <h6 class='text-white p-2'>
                    <a href='../admin/main'>메인</a> > <a href='../notice/adminList'>공지사항</a>  > <a href='../notice/fix?noticeNum=' + $('#noticeNum:checked').val()'>공지수정</a>
                </h6>
            </div>
        </div>
    </div>
</header>
<div class='row' id='mainBody'>
   <div class='col'>
  		<div class='row'>
           <div class='col pt-2 d-flex gap-3 mb-4'>
               <label for='noticeTitle'>
                   <h5 class='align-items-center text-nowrap pt-1'>제목</h5>
               </label>
               <div class='col shadow-sm'>
                   <input type='text' class='form-control' id='noticeTitle' maxlength='30'/>
               </div>
           </div>
       </div>
       <div class='row ms-4'>
           <div class='col'>
               <div class='row py-5 me-0' id='noticeImg'>
                   <div class='carousel slide' id='noticeCarousel' data-ride='carousel'>
                       <div class='carousel-inner' id='noticeImages'>
							<!-- 공지사항 이미지 -->	
                       </div>
                       <a href='#noticeCarousel' class='carousel-control-prev' data-bs-slide='prev'>
                           <i class="bi bi-chevron-left noticeCarouselBtn"></i>
                           <div class="visually-hidden">Previous</div>
                       </a>
                       <a href='#noticeCarousel' class='carousel-control-next' data-bs-slide='next'>
                           <i class="bi bi-chevron-right noticeCarouselBtn"></i>
                           <div class="visually-hidden">Next</div>
                       </a>
                   </div>
               </div>
           </div>
   		<form id='noticeImageUp'>
           	<input class='ms-3' type='file' name='noticeImage' multiple/>
       </form>	
       </div>
       <div class='row'>
           <div class='col pt-2 d-flex gap-3 mb-4'>
               <label for='noticeContent'>
                   <h5 class='align-items-center text-nowrap pt-1'>내용</h5>
               </label>
               <div class='col'>
                   <textarea class='form-control shadow-sm' rows='10' id='noticeContent' maxlength='300'></textarea>
               </div>
           </div>
       </div>
       <div class='d-flex gap-2 justify-content-end mb-3'>
           <a type='button' class='btn btn-olive'id='fixNoticeBtn'>
               <i class='bi bi-check-circle'></i>
               &nbsp;수정
           </a>
           <a type='button' class='btn btn-lightRed'id='delNoticeBtn'>
               <i class='bi bi-x-circle'></i>
               &nbsp;삭제
           </a>
       </div>
   </div>
</div>
<footer>
</footer>
</body>
</html>