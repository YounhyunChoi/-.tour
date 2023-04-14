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
<link href='../../res/adminStyle.css' rel='stylesheet'/>
<script src='../../res/adminNavigation.js'></script>
<script>
function tourList() {
	$('#tourContent').empty()
	
	$.ajax({
		url: 'getList',
		success: tours => {
			const tourArr = []
			
			if(tours.length) {
				$.each(tours, (i, tour) => {
					tourArr.push(
						`<div class='col-3 p-1 d-flex-column tourText pb-4' id='tourItem\${tour.tourNum}'>
							<div class='mt-2'>
								<img class='rounded-1 shadow-sm' src='<c:url value="/attach/` + tour.tourImageName + `"/>'style="max-width:90%; height:90%;"/>
							</div>
			                <div class='text-truncate align-middle pt-2'>\${tour.tourName}</div>
			            </div>`
					)
				})
				$('#tourContent').append(tourArr.join(''))

				$.each(tours, (i, tour) => {
					$(`#tourItem\${tour.tourNum}`).click(() => {
						location.href = `fix?tourNum=\${tour.tourNum}`
					})
				})
			} else {
				$('#tourContent').append(`<div class='text-center fs-3'>여행상품이 없습니다.</div>`)
			}
		}
	})
}

$(() => {
	//여행상품 리스트
	tourList()
	//검색
	$('#searchBtn').click(() => {
		if($('#tourSearch').val()) {
			$.ajax({
				url: 'getList',
				success: tours => {
					if(tours.length) {
						$('#tourContent').empty()
						
						$.each(tours, (i, tour) => {
							const tourSearchArr = []
							
							if((tour.tourName).includes($('#tourSearch').val())) {
								tourSearchArr.push(
									`<div class='col-3 p-1 d-flex-column tourText' id='tourItem\${tour.tourNum}'>
										<img src='<c:url value="/attach/` + tour.tourImageName + `"/>'style="max-width:90%; height:90%;"/>
						                <div class='text-truncate'>\${tour.tourName}</div>
						            </div>`
								)
							}
							$('#tourContent').append(tourSearchArr.join(''))
						})
						
						$.each(tours, (i, tour) => {
							$(`#tourItem\${tour.tourNum}`).click(() => {
								location.href = `fix?tourNum=\${tour.tourNum}`
							})
						})
					}
				}
			})
		} else {
			tourList()
		}
	})	
	//여행상품 등록으로 이동
	$('#tourAddBtn').click(() => {
		location.href = '../tour/add'
	})
})
</script>
<title>상품목록</title>
<style>
    [id*='tourItem'] {
        border: .1rem solid lightgray;
        border-radius: .2rem;
        margin: 1rem;
        height: 14rem;
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
                <c:if test='${logoName != null}'>
	                <div class='float-start ms-4 mt-1' style='height: 50px;'>
	         			<a href='../user/adminMain'>
	                 		<img src='<c:url value="/attach/${logoName}"/>' id='logo'/>
	                 	</a>
                	</div>
				</c:if>
				<c:if test='${logoName == null}'>
					<div class='float-start m-4 ms-4'>
						<a  class='border border-dark text-white p-2 mt-1' href='../user/adminMain' id='logo'>
							로고이미지
						</a>
					</div>
				</c:if>
                <h1 class='text-center pt-3 text-white'><b>상품목록</b></h1>
            </div>
        </div>
    </div>
</div>
<div class='row'>
    <div class='col'>
        <div class='navigation fixed-top pt-2' id='subHeader'>
            <h6 class='text-white p-2'>
                <a href='../user/adminMain'>메인</a> > <a href='../tour/adminList'>상품목록</a>
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
                	<!-- text창에서 enter입력시 submit 방지 -->
					<input type="text" style="display:none;">
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
<footer></footer>
</body>
</html>