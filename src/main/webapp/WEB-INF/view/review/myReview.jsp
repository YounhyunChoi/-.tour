<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css' rel='stylesheet' />
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css' />
<link href='https://getbootstrap.com/docs/5.3/assets/css/docs.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<link href='../res/style.css' rel='stylesheet' />
<script src='../res/navigation.js'></script>
<script src='../res/modal.js'></script>
<script>
$(() => {		
	$.ajax({
		url: 'getMyReviews',
		dataType: 'json',
		success: myReviews => {
			let html = ''
			
			if(myReviews.length) {
				$.each(myReviews, (i, myReview) => {
					if(i = 1) {
						html += `<div class='row mx-2 mt-5 shadow-sm border'>`
					} else {
						html += `<div class='row mx-2 mt-2 shadow-sm border'>`
					}
					html += `<div class='col'>
					            <div class='row align-items-center border-bottom'>
				                	<div class='col-4 fs-6'>후기번호 `
				                	
				   	for(i = (myReview.reviewNum + '').length; i < 4; i++) {
				   		html += `0`
				   	}
				                	
				    html +=            `\${myReview.reviewNum}</div>
				                	<div class='col'>\${myReview.tourName}</div>
				                	<div class='col-4 text-end'>
				                    	<a type='button' class='border-0 bg-white' href='view?reviewNum=\${myReview.reviewNum}'>
				                        <span class='fs-5'>상세보기</span>
				                        <i class='bi bi-chevron-right viewDetailBtn'></i>
				                    	</a>
				                	</div>
				            	</div>
				            	<div class='row mt-2'>`				    
				    
				    if(myReview.reviewImageName) {
					    html += 	`<div class='col-3 me-4'>
		                    			<div class='reviewImage'><img src='<c:url value="/attach/\${myReview.reviewImageName}"/>'/></div>
			                		</div>`
				    }
				                	
				    html +=			`<div class='col ms-2 fs-5 text-left'>
				                    	<p class='mb-0'>제목 \${myReview.reviewTitle}</p>
				                    	<p class='mb-0 d-flex align-items-center'>평점&nbsp`

					for(let i = 0; i < 5; i++) {
						if(myReview.score - i >= 1) {
							html += `<i class='bi bi-star-fill'></i>`
						} else if(myReview.score - i == 0.5) {
							html += `<i class='bi bi-star-half'></i>`
						} else {
							html += `<i class='bi bi-star'></i>`
						}
					}
				    	
				    html +=`			</p>
				    					<p class='mb-0'>\${myReview.userId}</p>
				                	</div>
				            	</div>
				            	<div class='row'>
				                	<p class='text-end'>
				                    	작성일 \${myReview.reviewDate}
				                	</p>
				            	</div>
				       	 	</div>
				    	</div>`
				})
			} else {
				html = `<div class='row d-block my-5'>
				            <div class='col text-center'>
				                <i class='bi bi-chat-dots'></i>
				                <h3 class='my-3'>
				                    작성한 후기가 없습니다.
				                </h3>
				            </div>
				            <div class='col text-center my-4'>
				                <p>코스 이용 후 소중한 후기를 남겨주세요.</p>
				            </div>
				            <div class='col text-center mt-5'>
				                <a type='button' href='../user/myPage'
				                    class='px-5 py-2 border-0 rounded btn-darkBlue text-center text-white'>
				                    마이 페이지로 가기
				                </a>
				            </div>
				        </div>`
			}
			
			$('#myReview').append(html)
			if('${param.reviewErrMsg}') {
				showOkModal('${param.reviewErrMsg}')
			}
		}
	})
})
</script>
<title>myReview</title>
<style>
    .viewDetailBtn {
        font-size: 1.5rem;
    }
    
    .bi-chat-dots {
            font-size: 3rem;
    }
</style>
</head>
<header></header>
<div class='navigation fixed-top'>
    <div class='float-start mt-3 ms-2'><i class='bi bi-chevron-left' id='historyBtn'></i></div>
    <div class='menuName'>
        <h2 class='text-center pt-3'><b>내가 쓴 후기</b></h2>
    </div>
</div>
<div class='container' id='myReview'>
</div>
<footer></footer>
</body>
</html>