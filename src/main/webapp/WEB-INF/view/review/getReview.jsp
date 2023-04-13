<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
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
<script src='../res/modal.js'></script>
<script>
    $(() => {
        $('#reportComment').click(() => showConfirmModal('댓글을 신고하시겠습니까?', '댓글이 신고되었습니다.'))
    })
    
    function listReviews() {
    	$('#reviews').empty()
    	
    	$.ajax({
    		url: 'get',
    		success: reviewList => {
    			if(reviewList.length) {
    				reviews = []
    				reviewsList.forEach(review => {
    					reviews.unshift(
    							'<div class="row mx-2 mt-5 shadow-sm border"><div class="col">' +
    					        '<div class="row align-items-center border-bottom"><div class="col-4 fs-6" value="' +
    					        후기번호+ review.reviewNum + '"/><div class="col fs-4">'+
    					        review.tourNum + '</div></div><div class="row mt-2"><div class="col-4">' +
    					        '<div class="reviewImage">' + reviewImagas.reviewimageNum + '</div></div>' +
    					        '<div class="col-6 ms-2 fs-5 text-left">' +
    					        제목+ review.reviewTitle + '<br>' +
    					        평점+ review.score + '<br>' +
    					        review.userId +'</div></div><div class="row"><p class="text-end">' +
    					        작성일+ review.reviewDate + '</p></div><div class="row fs-5 px-3 pb-2">' +
    					        review.reviewContent + '</div></div></div>')
    				})
    			}
    		}
    	})
    }
</script>
<title></title>
<style>
</style>
</head>
<body>
<header>
</header>
<div class='navigation fixed-top'>
    <div class='float-start mt-2 ms-2'><i class='bi bi-chevron-left'onclick="location.href='../user/mypage.html'"></i></div>
    <div class='menuName'>
        <h2 class='text-center pt-3'><b>내가 쓴 후기 조회</b></h2>
    </div>
</div>
<div class='container' id='reviews'>
</div>
<div class='container mt-4'>
    <div class='row justify-content-end'>
        <div class='col-3'>
            <a href='../comment/add' type='button' class='btn btn-darkBlue form-control'>
                <span>댓글쓰기</span>
            </a>
        </div>
        <div class='col-3'>
            <a href='../review/fix' type='button' class='btn btn-olive form-control'>
                <span>수정하기</span>
            </a>
        </div>
    </div>
</div>
<div class='container px-4 mt-4 shadow-sm'>
    <div class='row border-bottom align-items-center border rounded-top'>
        <div class='col-3'>
            <div class='fs-3'>java02</div>
        </div>
        <div class='col-4'>
            <div class='fs-6'>댓글번호 0001</div>
        </div>
        <div class='col'>
            <div class='dropdown float-end'>
                <a class='btn' type='button' 
                data-bs-toggle='dropdown' aria-expanded='false'>
                    <i class='bi bi-three-dots-vertical justify-content-end'></i>
                </a>
                <ul class='dropdown-menu commentMenu p-0 border-lightRed'>
                    <li class='border-bottom'><a class='dropdown-item btn' id='reportComment'
                        data-bs-toggle='modal' data-bs-target='#modal'>신고</a></li>
                    <li><a class='dropdown-item btn border-olive' href="../comment/02.html">수정</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class='row border-start border-end'>
        <div class='col'>
            <div class='fs-6'>
                너무 부러워요
            </div>
        </div>
    </div>
    <div class='row border-start border-end rounded-bottom'>
        <div class='col'>
            <div class='fs-6 text-end'>
                작성일 2023-03-18
            </div>
        </div>
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