<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<html id='twbsPagination'>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css' rel='stylesheet'/>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'/>
<link href='https://getbootstrap.com/docs/5.3/assets/css/docs.css' rel='stylesheet'/>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<link href='../../res/adminStyle.css' rel='stylesheet'/>
<script src='../../res/adminNavigation.js'></script>
<script src='../../res/twbsPagination.js'></script>
<script>
$(() => {
	$.ajax({
		url: 'get',
		success: tours => {
			//하나의 페이지에 보여줄 상품 수
			let pageSize = 6;
			//상품의 총 개수
			let totalCount = tours.length;
			//전체 페이지 수
			let totalPages = Math.ceil(totalCount / pageSize);
			
			//검색
			/* --- */
			
			//페이지
				$('#indexNum').twbsPagination({
					totalPages: totalPages,
					first: '<span aria-hidden="true">&laquo;</span>',
					prev: '<span aria-hidden="true">&lsaquo;</span>',
					next: '<span aria-hidden="true">&rsaquo;</span>',
			        last: '<span aria-hidden="true">&raquo;</span>',
					onPageClick: function (e, page) {
						$('#tourContent').empty()
						const tourArr = []
						let tourText = ""
						
						if(totalCount) {
							$.each(tours, (i, tour) => {
								if(Math.floor(i / pageSize) == page - 1) {
									tourText += 
										`<div class='col-3 p-1 d-flex-column tourText' id='tourItem\${tour.tourNum}'>
							                <div class='py-5 border border-3 text-nowrap'>여행코스이미지</div>
							                <div class='text-truncate'>\${tour.tourName}</div>
							            </div>`
								}
							})
						}
						
						tourArr.unshift(tourText)
						$('#tourContent').append(tourArr.join(''))
						
						$.each(tours, (i, tour) => {
							$(`#tourItem\${tour.tourNum}`).click(() => {
								location.href = `adminFixDelView?tourNum=\${tour.tourNum}`
							})
						})
					}
				})
		}
	})
	
	$('#tourAddBtn').click(() => {
		location.href = '../tour/adminAddView'
	})
})
</script>
<title>상품목록</title>
<style>
    [id*='tourItem'] {
        border: .1rem solid;
        margin: 1rem;
        box-shadow: .1rem .1rem .1rem .1rem lightgray;
    }

    .tourText {
        text-align: center;
        cursor: pointer;
    }

    .searchIcon {
        font-size: 1.6rem;
    }
</style>
</head>
<body>
<header>
    <div class='container-fluid'>
        <div class='row'>
            <div class='col'>
                <div class='navigation fixed-top pt-2 pb-3' id='adminHeader'>
                    <div class='float-start m-4 ms-4'><a class='border border-dark text-white p-2 mt-1' href='../main.html' id='logo'>로고이미지</a></div>
                    <h1 class='text-center pt-3 text-white'><b>상품목록</b></h1>
                </div>
            </div>
        </div>
    </div>
    <div class='row'>
        <div class='col'>
            <div class='navigation fixed-top pt-2' id='subHeader'>
                <h6 class='text-white p-2'>
                    <a href='../admin/main'>메인</a> > <a href='../tour/adminList'>상품목록</a>
                </h6>
            </div>
        </div>
    </div>
</header>
<div class='row' id='mainBody'>
    <div class='col'>
        <form class='mb-4'>
            <div class='row'>
                <div class='col-10 pe-0 pt-2'>
                    <input type='text' class='form-control' id='tourSearch'/>
                </div>
                <div class='col-2 p-0'>
                    <a href='#' type='button' class='btn' id='searchBtn'><i class='icon bi bi-search'></i></a>
                </div>
            </div>
        </form>
		<div class='row' id='tourContent'>

        </div>
        <div class='row'>
            <div class='col-10'>
                <nav aria-label='Page navigation example'>
                    <ul class='pagination d-flex justify-content-center mt-5' id='indexNum'></ul>
                </nav>
            </div>
            <div class='col-2 align-self-center'>
                <button type='button' class='btn btn-darkBlue' id='tourAddBtn'>
                    <span class='bi bi-plus-circle text-truncate'>&nbsp;등록</span>
                </button>
            </div>
        </div>
    </div>
</div>
<footer>
</footer>
</body>
</html>