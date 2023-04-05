<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
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
    <script src='../res/modal.js'></script>
    <title>REVIEW.02 후기쓰기</title>
    <script>
        $(() => {
            $('#reviewAddBtn').click(() => {
                showConfirmModal('후기를 등록하시겠습니까?', '후기가 등록되었습니다.', 'get')
                
                $('#okBtn').click(() => {
                	if($('#reviewTitle').val() && $('#reviewContent').val() && $('#reviewimageNum').val() && $('#score').val()) {
                		let review = {
                				reviewTitle: $('#reviewTitle').val(),
                				reviewContent: $('#reviewContent').val(),
                				reviewimageNum: $('#reviewimageNum').val(),
                				score: $('score').val()
                		}
                		
                		$.ajax({
                			url: 'add',
                			method: 'post',
                			data: review,
                			success: listReviews
                		})
                	}
                })
            })
        })
    </script>
    <style>
        .contentBtn {
            width: 68px;
            height: 38px;
        }
    </style>
</head>
<body>
    <header>
    </header>
    <div class='navigation fixed-top'>
        <div class='float-start mt-2 ms-2'><i class='bi bi-caret-left-fill' onclick="location.href='../user/mypage.html'"></i></div>
        <div class='menuName'>
            <h2 class='text-center pt-3'><b>후기쓰기</b></h2>
        </div>
    </div>
    <div class='container mt-4 px-4 text-center'>
        <div class='row mb-3 d-flex justify-content-between'>
            <div class='col-2 text-end text-nowrap'><b class='fs-4'>제목</b></div>
            <div class='col-10'>
                <input type='text' class='form-control shadow-sm reviewTitle'>
            </div>
        </div>
        <div class='row mb-3 d-flex justify-content-between'>
            <div class='col-2 text-end text-nowrap'><b class='fs-4'>내용</b></div>
            <div class='col-10'>
                <textarea id='reviewContent' rows='10' class='form-control'></textarea>
            </div>
        </div>
        <div class='row mb-2'>
            <div class='col-2'></div>
            <div class='col-4 text-start'>
                <input type='file' id='inputImg' class='d-none'>
                <button type='button'
                    class='reviewimageNum contentBtn border-0 btn-lightGray rounded text-white'>
                    <label for='inputImg'>사진추가</label>
                </button>
            </div>
            <div class='col-6 text-end'>
                <div class='fs-4'>평점 ☆☆☆☆☆</div>
            </div>
        </div>
        <div class='row'>
            <div class='col text-end'>
                <button type='button' id='reviewAddBtn' 
                    data-bs-toggle='modal' data-bs-target='#modal'
                    class='contentBtn border border-0 rounded  btn-darkBlue text-white'>
                    등록
                </button>
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