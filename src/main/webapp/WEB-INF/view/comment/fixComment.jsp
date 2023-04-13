<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
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
    	$('#deleteComment').click(() => {
       		showConfirmModal('댓글을 삭제하시겠습니까?')
       		
       		$('#okBtn').click(() => {
           		$.ajax({
           			url: 'del/' + ${param.comtNum},
           			method: 'delete',
           			success: () => {
           				$(location).attr('href', '../review/get')
           			}
           		})
       		})
        })
    	
        $('#editComment').click(() => {
        	if($('#comtContent').val()){
        		$.ajax({
        			url: 'fix',
        			method: 'put',
        			data: {
        				comtContent: $('#comtContent').val(),
        				comtNum: ${param.comtNum}
        			}
        		})
        		$('#editComment').attr('href', '../review/get')
        	} else {
    			showOkModal('댓글을 입력해주세요.')
    		}
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
   <div class='float-start mt-2 ms-2'><i class='bi bi-chevron-left'></i></div>
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
            <textarea class='form-control' id='comtContent' maxlength='100'></textarea>
            <span class='mt-2 gap-2 d-flex justify-content-end'>
                <a class='btn btn-lightRed' id='deleteComment'>댓글삭제</a>
                <a class='btn btn-olive' id='editComment'>댓글수정</a>
            </span>
        </div>
    </div>
</div>
</div>
<footer>
</footer>
</body>
</html>