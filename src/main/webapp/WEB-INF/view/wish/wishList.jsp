<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css' rel='stylesheet'/>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'/>
<link href='https://getbootstrap.com/docs/5.3/assets/css/docs.css' rel='stylesheet'/>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<link href='/res/style.css' rel='stylesheet'/>
<script src='/res/navigation.js'></script>
<script src='/res/modal.js'></script>
<script>
//개발중

function wishList() {
	let wishArr = []
	
	$.ajax({
		url: 'wish/get',
		success: wishes => {
			if(wishes.length) {
				
			}
		}
	})
}

$(() => {

	wishList()
	
})
</script>
<style>
	.image {
		flex-wrap: wrap;
		justify-content: center;
		align-content: center;
		border: 1px solid #dee2e6;
		border-color: #212529;
		border-width: 2px;
		width: 6.5rem;
		height: 6rem;
	}
	
	.viewDetailBtn {
		font-size: 1.5rem;
	}
	
    .heartIcon {
        font-size: 3rem;
    }
</style>
</head>
<header>
</header>
<div class='navigation fixed-top'>
    <div class='float-start mt-2 ms-2'><i class='bi bi-caret-left-fill' onclick="location.href='../user/mypage.html'"></i></div>
    <div class='menuName'>
        <h2 class='text-center pt-3'><b>찜내역</b></h2>
    </div>
</div>

<div class='container px-4' id='wishContent'>
    
</div>

<footer>
</footer>
</body>
</html>