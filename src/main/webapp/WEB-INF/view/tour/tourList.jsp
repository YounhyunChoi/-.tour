<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
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
	url: 'tour/getList',
	success: tours => {
		const tourArr = []
		let tourText = ""
		
		if(tours.length) {
			$.each(tours, (i, tour) => {
				tourArr.push(
					`<div class='col-5 p-1 d-flex-column tourText pb-4' id='tourItem\${tour.tourNum}'>
						<div class='mt-2'>
							<img class='rounded-1 shadow-sm' src='<c:url value="/attach/` + tour.tourImageName + `"/>' style="max-width:90%; height:90%;"/>
						</div>
						<div class='text-truncate align-middle pt-2'>\${tour.tourName}</div>
					</div>`
				)
			})
			$('#tourContainer').append(tourArr.join(''))
		} else {
			$('#tourContainer').append('<p class=mt-5><h5 class=text-center>등록된 여행상품이 없습니다.</h5></p><br><hr>')
		}
		
		$.each(tours, (i, tour) => {
			$(`#tourItem\${tour.tourNum}`).click(() => {
				location.href = `tour/view?tourNum=\${tour.tourNum}`
			})
		})
	}
})
</script>
<title>여행코스 목록</title>
<style>
    [id*='tourItem'] {
        border: .1rem solid lightgray;
        border-radius: .2rem;
        margin: 1rem;
        height: 13rem;
        box-shadow: .1rem .1rem .1rem 0 lightgray;
    }

    .tourImg {
        height: 13rem;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .tourText {
        text-align: center;
        cursor: pointer;
    }
</style>
</head>
<body>
<header></header>
<div class='navigation fixed-top'>
	<div class='float-start mt-3 ms-2'>
		<i class='bi bi-chevron-left' id='historyBtn'></i>
	</div>
	<div class='menuName'>
		<h2 class='text-center pt-3'><b>코스목록</b></h2>
	</div>
</div>
<div class='container'>
	<div class='row mb-4' id='tourContainer'>
		<!-- 여행상품 리스트 -->
	</div>
</div>
<footer></footer>
</body>
</html>