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
        $('#fixComment').click(() => {
        	showConfirmModal('댓글을 수정하시겠습니까?', '댓글이 수정되었습니다.', '../review/04.html')
        	
        	$('#okBtn').click(() => {
        		if($('#comtContent').val()) {
    				let comment = {
    						comtContent: $('#comtContent').val()
    				}
    				
    				$.ajax({
    					url: 'fix',
    					method: 'put',
    					contentType: 'application/json',
    					data: JSON.stringify(comment)
    				})
    			}
        	})
		})
		
		$('#deleteComment').click(() => {
			showConfirmModal('댓글을 삭제하시겠습니까?', '댓글이 삭제되었습니다.', '../review/04.html')
			$('#okBtn').click(() => {
				$.ajax({
					url: 'del' ,
					method: 'delete'				
				})
        	})
		})
    })
</script>
<title>댓글수정</title>
<style>
   
</style>
</head>
<body>
<header>
</header>
<div class='navigation fixed-top'>
   <div class='float-start mt-2 ms-2'><i class='bi bi-caret-left-fill' onclick="location.href='../review/04.html'"></i></div>
   <div class='menuName'>
      <h2 class='text-center pt-3'><b>댓글수정</b></h2>
   </div>
</div>
<div class='container'>
<div class='row'>
    <div class='col mt-5'>
        <div class='p-2 border border-secondary shadow-sm rounded-3' id='one'>
            <h3>java01</h3>
            <hr>
            <textarea class='form-control' id='comtContent'></textarea>
            <span class='mt-2 gap-2 d-flex justify-content-end'>
                <a class='btn btn-lightRed' data-bs-toggle='modal' data-bs-target='#modal' id='deleteComment'>댓글삭제</a>
                <a class='btn btn-olive' data-bs-toggle='modal' data-bs-target='#modal' id='fixComment'>댓글수정</a>
            </span>       
        </div>
    </div>
</div>
</div>
<div class='modal modal-center fade' id='modal'>
    <div class='modal-dialog modal-smallsize'>
        <div class='modal-content'>
            <div class='pb-4' id='modalMsg'>
            </div>
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