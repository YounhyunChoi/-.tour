<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css' rel='stylesheet'/>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'/>
<link href='https://getbootstrap.com/docs/5.3/assets/css/docs.css' rel='stylesheet'/>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<link href='../res/style.css' rel='stylesheet'/>
<title>NOTICE.01 공지 목록</title>
<script src='../res/navigation.js'></script>
<script>
$(() => {
    	$.ajax({
    		url: 'notice/get',
    		dataType:'json',
    		success: notices => {
    			if(notices.length) {
    				const noticeArr = []
    				
    				$.each(notices, (i, notice) => {
    					noticeArr.push(
						        	`<a href='notice/view?notice_num=${notice.noticeNum}' class='noticeName'><h4><b>\${notice.noticeNum}. \${notice.noticeTitle}</b></h4></a>
						        	<span class='col noticeContent'>
						            	<p><h5>\${notice.noticeContent}</h5></p><br>
						            	<p>\${notice.noticeDate}</p>
						        	</span>
						        	<hr>`
    							)
    						})
    				
    				$('#notices').append(noticeArr.join(''))
    			} else $('#notices').append(
    					'<p><h5 class=text-center>게시된 공지사항이 없습니다.</h5></p><br><hr>')
    		}
    	})
    })
</script>

<style>
   .noticeName{
        color: black;
   }
</style>
</head>
<body>
<header>
</header>
<div class='navigation fixed-top'>
   <div class='float-start mt-3 ms-2'>
   		<i class='bi bi-caret-left-fill' onClick='history.back()'></i>
   </div>
   <div class='menuName'>
      <h2 class='text-center pt-3'><b>공지사항</b></h2>
   </div>
</div>
<div class='container'>
    <div class='row mt-5' id='notices'>
    	<!-- 공지사항 목록-->
    </div>
</div>
<footer>
</footer>
</body>
</html>