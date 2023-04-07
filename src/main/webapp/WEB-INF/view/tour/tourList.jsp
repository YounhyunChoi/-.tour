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
		url: 'tour/get',
		success: tours => {
			const tourArr = []
			
			if(tours.length) {
				$.each(tours, (i, tour) => {
					if((i + 1) % 2 == 1) {
						tourArr.push(
							`<div class='row'>
				                <div class='col p-1 d-flex-column tourText' id='tourItem\${tour.tourNum}'>
				                    <div class='border border-3 text-nowrap tourImg'>여행코스이미지</div>
				                    <div class='text-truncate'>\${tour.tourName}</div>
				                </div>`
			            )
					} else {
						tourArr.push(
							`<div class='col p-1 d-flex-column tourText' id='tourItem\${tour.tourNum}'>
			                    <div class='border border-3 text-nowrap tourImg'>여행코스이미지</div>
			                    <div class='text-truncate'>\${tour.tourName}</div>
			                </div>
			            </div>`)
					}
				})
				
				$('#tourContainer').append(tourArr.join(''))
				
				$.each(tours, (i, tour) => {
					$(`#tourItem\${tour.tourNum}`).click(() => {
						location.href = `tour/view?tourNum=\${tour.tourNum}`
					})
				})
			}
		}
	})
})
</script>
<title>TOUR.01 여행코스 목록</title>
<style>
    [id*='tourItem'] {
        border: .1rem solid;
        margin: 1rem;
        height: 14rem;
        box-shadow: .1rem .1rem .1rem .1rem lightgray;
    }

    .tourImg {
        height: 12rem;
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
<header>
</header>
<div class='navigation fixed-top'>
   <div class='float-start mt-3 ms-2'><i class='bi bi-caret-left-fill' onclick="location.href='../main.html'"></i></div>
   <div class='menuName'>
      <h2 class='text-center pt-3'><b>코스목록</b></h2>
   </div>
</div>
<div class='container'>
    <div class='row mb-4'>
        <div id='tourContainer' class='col'>
            
        </div>
    </div>
</div>
<footer>
</footer>
</body>
</html>