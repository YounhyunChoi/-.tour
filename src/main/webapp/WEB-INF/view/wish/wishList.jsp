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
<script src='../res/modal.js'></script>
<script>
function wishList() {
	$.ajax({
		url: 'wish/get',
		success: wishes => {
			if(wishes.length) {
				let wishArr = []
				let wishText = ""
				
				$.ajax({
					url: 'tour/getList',
					success: tours => {
						$.each(wishes, (i, wish) => {
							wishText =
								`<div class='row mt-4 d-flex flex-column shadow-sm border border-1'>
									<div class='col p-2 border-bottom'>
							            <div class='row d-flex justify-content-between'>
							                <div class='col-4 fs-4 text-center'>
							                	<span>
							                		찜번호
							                		<span class='mb-1 wishNum'>\${wish.wishNum}</span>
							                	</span>
							                </div>
							                <div class='col-4 text-end'>
							                    <button type='button' class='border-0 bg-white'>
							                        <span class='fs-5'>상세보기</span>
							                        <i class='bi bi-chevron-right viewDetailBtn'></i>
							                    </button>
							                </div>
							            </div>
							        </div>`;

							if(tours.length) {
								$.each(tours, (i, tour) => {
									if(wish.tourNum == tour.tourNum) {
										wishText += 
											`<div class='col my-3'>
												<div class='row'>
													<div class='col-4'>
														<div class='d-flex flex-column align-items-center'>
															<div class='d-flex image'>
																<img src='<c:url value="/attach/` + tour.tourImageName + `"/>' style="max-width:100%; height:100%;"/>
															</div>
														</div>
													</div>
													<div class='col-5 fs-5'>
									                    <div class='text-left'>
									                        \${tour.tourName}
									                    </div>
									                </div>
													<div class='col-3 d-flex justify-content-center align-self-end'>
									                    <button type='button' id='\${wish.wishNum}' name='wishDelBtn' value='\${wish.wishNum}'
									                    class='border border-0 rounded text-white btn btn-lightRed'>삭제</button>
									                </div>
									            </div>
									        </div>
										</div>`;
								
										wishArr.unshift(wishText)
									}
								})
							}
						})
						$('#wishContent').append(wishArr.join(''))

						for(let i = 0; i < $('.wishNum').length; i++){
							$('.wishNum').eq(i).text($('.wishNum').eq(i).text().padStart(4, '0'))
						}
						
						$.each(tours, (i, tour) => {
							$(`#tourItem\${tour.wishNum}`).click(() => {
								location.href = `tour/view?tourNum=\${tour.tourNum}`
							})
						})
					}
				})
				
			} else {
				let wishArr = []
				
				wishArr.unshift(
					`<div class='row d-block my-5' id='noWishList'>
			            <div class='col text-center'>
			                <i class='bi bi-heart heartIcon'></i>
			                <h3 class='my-3'>
			                    찜 내역이 없습니다.
			                </h3>
			            </div>
			            <div class='col text-center my-4'>
			                <p>상품을 찜해보세요</p>
			            </div>
			            <div class='col text-center mt-5'>
			                <button id='mypageBtn' type='button' class='px-5 py-2 border-0 rounded text-center text-white btn-darkBlue'
			                	onclick="location.href='../user/myPage'">
			                	마이 페이지로 가기
			                </button>
			            </div>
					</div>`
				)
				
				$('#wishContent').append(wishArr.join(''))
				wishArr = []
			}
			
			//Wish 삭제
			$(document).on('click', '[name="wishDelBtn"]', function(e) {
				$.ajax({
					url: 'wish/del/' + e.target.value,
					method: 'delete',
					success: showOkModal('찜이 삭제되었습니다.')
				})
				
				$('#modalOk').click(() => {
					window.location.reload()
				})
			})
		}
	})
}
$(wishList)
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
<header></header>
<div class='navigation fixed-top'>
    <div class='float-start mt-3 ms-2'><i class='bi bi-chevron-left' id='historyBtn' onclick="location.href='../user/mypage.html'"></i></div>
    <div class='menuName'>
        <h2 class='text-center pt-3'><b>찜내역</b></h2>
    </div>
</div>
<div class='container px-4' id='wishContent'>
</div>
<footer></footer>
</body>
</html>