<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css' rel='stylesheet'/>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'/>
<link href='https://getbootstrap.com/docs/5.3/assets/css/docs.css' rel='stylesheet'/>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<link href='../res/style.css' rel='stylesheet'/>
<script src='../res/navigation.js'></script>
<script>
$(() => {
	$.ajax({
		url: 'get',
		dataType: 'json',
		success: reviews => {
			let reviewhtml = ''
			if(reviews.length) {
				$.each(reviews, (i, review) => {
					reviewhtml += `<div class='row mx-2 mt-3 shadow-sm border'>
								<div class='col'>
					            	<div class='row align-items-center border-bottom'>
				                		<div class='col-4 fs-6'>후기번호 `
				                	
				   	for(i = (review.reviewNum + '').length; i < 4; i++) {
				   		reviewhtml += `0`
				   	}
				                	
				   	reviewhtml +=            `\${review.reviewNum}</div>
				                	<div class='col'>\${review.tourName}</div>
				                	<div class='col-4 text-end'>
				                    	<a type='button' class='border-0 bg-white' href='view?reviewNum=\${review.reviewNum}'>
				                        <span class='fs-5'>상세보기</span>
				                        <i class='bi bi-chevron-right viewDetailBtn'></i>
				                    	</a>
				                	</div>
				            	</div>
				            	<div class='row mt-2'>`				    
				    
				    if(review.reviewImageName) {
				    	reviewhtml += 	`<div class='col-3 me-4'>
		                    			<div class='reviewImage'><img src='<c:url value="/attach/\${review.reviewImageName}"/>'/></div>
			                		</div>`
				    }
				                	
			        reviewhtml +=		`<div class='col ms-2 fs-5 text-left'>
				                    	<p class='mb-0'>제목 \${review.reviewTitle}</p>
				                    	<p class='mb-0 d-flex align-items-center'>평점&nbsp`
	
					for(let i = 0; i < 5; i++) {
						if(review.score - i >= 1) {
							reviewhtml += `<i class='bi bi-star-fill'></i>`
						} else if(review.score - i == 0.5) {
							reviewhtml += `<i class='bi bi-star-half'></i>`
						} else {
							reviewhtml += `<i class='bi bi-star'></i>`
						}
					}
				    	
					reviewhtml +=`			</p>
				    					<p class='mb-0'>\${review.userId}</p>
				                	</div>
				            	</div>
				            	<div class='row'>
				                	<p class='text-end'>
				                    	작성일 \${review.reviewDate}
				                	</p>
				            	</div>
				       	 	</div>
				    	</div>`
				})
			} else {
				reviewhtml += `<div class='col text-center'>
	                <i class='bi bi-chat-dots'></i>
	                <h3 class='my-3'>
	                    작성된 후기가 없습니다.
	                </h3>
	            </div>
	            <div class='col text-center mt-5'>
		           <a type='button' href='/'
		               class='px-5 py-2 border-0 rounded btn-darkBlue text-center text-white'>
		               메인 페이지로 가기
		           </a>
		       </div>`
			}
			$('.container').eq(1).append(reviewhtml)
		}
	})
})
</script>
<title></title>
<style>
    .page-link {
        color:black;
    }
</style>
</head>
<body>
<header>
</header>
<div class='navigation fixed-top'>
    <div class='float-start mt-2 ms-2'><i class='bi bi-chevron-left' id='historyBtn'></i></div>
    <div class='menuName'>
        <h2 class='text-center pt-3'><b>후기 목록</b></h2>
    </div>
</div>
<div class='container'>
    <form>
        <div class='row d-flex align-items-center mx-2 mt-3'>
            <div class='col-3'>
                <select class='form-select'>
                    <option selected>제목</option>
                    <option>내용</option>
                    <option>후기번호</option>
                    <option>여행코스명</option>
                    <option>아이디</option>
                </select>
            </div>
            <div class='col-8'>
                <input type='text' class='form-control'>
            </div>
            <div class='col-1 p-0'>
                <a href='#'>
                    <i class='bi bi-search icon'></i>
                </a>
            </div>
        </div>
    </form> 
</div>
<footer>
</footer>
</body>
</html>