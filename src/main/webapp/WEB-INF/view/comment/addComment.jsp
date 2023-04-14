<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
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
    	$('#addComment').click(() => {
    		if($('#comtContent').val()){
    			$.ajax({
        			url: 'add',
        			method: 'post',
        			data: {
        				comtContent: $('#comtContent').val(),
        				reviewNum: ${param.reviewNum}
        			}
        		})
        		$('#addComment').attr('href', '../review/get')
    		} else {
    			showOkModal('댓글을 입력해주세요.')
    		}
    	})
    })
</script>
<title>댓글쓰기</title>
</head>
<body>
<header>
</header>
<div class='navigation fixed-top'>
   <div class='float-start mt-2 ms-2'><i class='bi bi-chevron-left' id='historyBtn'></i></div>
   <div class='menuName'>
      <h2 class='text-center pt-3'><b>댓글쓰기</b></h2>
   </div>
</div>
<div class='container'>
<div class='row'>
    <div class='col mt-5'>
        <div class='p-2 border border-secondary shadow-sm rounded-3' id='one'>
            <h3>java01</h3>
            <hr>
            <textarea class='form-control' id='comtContent' maxlength='100'></textarea>
            <span class='mt-2 d-flex justify-content-end'>
                <a class='btn btn-darkBlue' id='addComment'>댓글등록</a>
            </span>
        </div>
    </div>
</div>
</div>
<footer>
</footer>
</body>
</html>