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
<script src='../res/navigation.js'></script>

<script>
$(() => {
	$.ajax({
		url: 'notice/view/' + ${notice.noticeNum},
		dataType: 'json',
		success: notices => {
			const noticeArr = []
				$.each(notices, (i, notice) => {
					notices.push(
								`<h3 class='noticeName' value='\${notice.noticeNum}' 
		        				id='noticeNum'><b>\{notice.noticeNum}. ${notice.noticeTitle}</b></h3>
		        				<span class='col noticeContent'>
		            				<p>\${notice.noticeDate}</p>
		        				</span>
		        				<hr>
		        				<div class='border text-center mb-3 noticeImg'>공지사항이미지</div>
		        				<span>\${notice.noticeContent}</span>`
						)
			})
		}
	})
})
</script>

<title>NOTICE.02 공지 조회</title>
<style>
    .noticeName{
        color: black;
   }

   .noticeImg{
        padding:5rem;
   }
</style>
</head>
<body>
<header>
</header>
<div class='navigation fixed-top'>
   <div class='float-start mt-3 ms-2'><i class='bi bi-caret-left-fill' onclick="location.history()"></i></div>
   <div class='menuName'>
      <h2 class='text-center pt-3'><b>공지상세</b></h2>
   </div>
</div>
<div class='container'>
    <div class='row mt-5' id='noticeView'>
        
    </div>
</div>
<footer>
</footer>
</body>
</html>