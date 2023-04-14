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
$.ajax({
	url: 'event/get',
	dataType: 'json',
	success: events => {
		if(events.length){
			const eventArr = []
			
			$.each(events, (i, event) => {
				eventArr.push(
					`<a href='event/view?eventNum=\${event.eventNum}' class='noticeName'><h4><b>\${event.eventNum}. \${event.eventTitle}</b></h4></a>
   					<span class='col noticeContent'>
				        <p><h5>\${event.eventContent}</h5></p><br>
				        <p>작성일 \${event.eventDate}</p>
				    </span>
				    <hr>`)
			})
			$('#events').append(eventArr.join(''))
		} else $('#events').append(
				'<p><h5 class=text-center>게시된 이벤트가 없습니다.</h5></p><br><hr>')
	}
})
</script>
<title>이벤트목록</title>
<style>
   .noticeName{
        color: black;
   }
</style>
</head>
<body>
<header></header>
<div class='navigation fixed-top'>
   <div class='float-start mt-3 ms-2'><i class='bi bi-chevron-left' id='historyBtn'></i></div>
   <div class='menuName'>
      <h2 class='text-center pt-3'><b>이벤트 목록</b></h2>
   </div>
</div>
<div class='container'>
    <div class='row mt-5' id='events'>
		<!-- 이벤트 목록 -->
    </div>
</div>
<footer></footer>
</body>
</html>