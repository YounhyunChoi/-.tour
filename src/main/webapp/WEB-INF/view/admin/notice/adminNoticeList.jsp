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
function listNotice() {
	$.ajax({
		url: 'get',
		dataType: 'json',
		success: notices => {
			$('#notices').empty()
			if(notices.length) {
				const noticeArr = []
				
				$.each(notices, (i, notice) => {
					noticeArr.push(
							`<tr>
	                            <td class='align-middle'>
	                            	<input type='radio' name='noticeHeader' id='noticeNum' value='\${notice.noticeNum}'/>
	                            </td>
	                            <td>\${notice.noticeNum}</td>
	                            <td>\${notice.noticeTitle}</td>
	                            <td class='text-truncate' style="max-width: 150px;">\${notice.noticeContent}</td>
	                            <td>\${notice.noticeDate}</td>
                        	</tr>`
                       )
				})
				$('#notices').append(noticeArr.join(''))
			} else {
				$('#notices').append(
					'<tr><td colspan=5 class=text-center>등록된 공지사항이 없습니다.</td></tr>')
			}
		}
	})
}
$(() => {
	$('#fixNoticeBtn').click(() => {
		if($('#noticeNum:checked').val()){
			$('#fixNoticeBtn').attr('href', 'fix?noticeNum=' + $('#noticeNum:checked').val())
		}
	})	
	listNotice()
	
	$('#searchBtn').click(() => {
		if($('#noticeSearch').val()) {
			$.ajax({
				url: 'get',
				success: notices => {
					const noticeSearchArr = []	
					if(notices.length) {				
						$.each(notices, (i, notice) => {
							if((notice.noticeTitle).includes($('#noticeSearch').val())) {
								noticeSearchArr.push(
									`<tr>
			                            <td class='align-middle'>
			                            	<input type='radio' name='noticeHeader' id='noticeNum' value='\${notice.noticeNum}'/>
			                            </td>
			                            <td>\${notice.noticeNum}</td>
			                            <td>\${notice.noticeTitle}</td>
			                            <td class='text-truncate' style="max-width: 150px;">\${notice.noticeContent}</td>
			                            <td>\${notice.noticeDate}</td>
		                        	</tr>`)
							}
						})
					}
					
					if(!noticeSearchArr.length) {
						noticeSearchArr.push(
								'<tr><td colspan=5 class=text-center>검색된 공지사항이 없습니다.</td></tr>')
					}
						
					$('#notices').empty()
					$('#notices').append(noticeSearchArr.join(''))
				}
			})
		} else listNotice()
	})
})
</script>
<title>공지사항</title>
<style>
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
                <h1 class='text-center pt-3 text-white'><b>공지사항</b></h1>
            </div>
        </div>
    </div>
</div>
<div class='row'>
    <div class='col'>
        <div class='navigation fixed-top pt-2' id='subHeader'>
            <h6 class='text-white p-2'>
                <a href='../user/adminMain'>메인</a> > <a href='../notice/adminList'>공지사항</a>
            </h6>
        </div>
    </div>
</div>
</header>
<div class='row' id='mainBody'>
   <div class='col'>
        <div class='mb-4'>
            <div class='row'>
                <div class='col-6 pt-2'>
                    <input type='text' class='form-control' id='noticeSearch'/>
                </div>
                <div class='col'>
                    <a type='button' class='btn'><i class='icon bi bi-search' id='searchBtn'></i></a>
                </div>
                <div class='col'>
                    <div class='d-flex justify-content-end'>
                        <a type='button' class='btn btn-darkBlue' id='addNoticeBtn' href='add'>
                            <i class='bi bi-plus-circle'></i>&nbsp;새글
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class='row'>
            <div class='col'>
                <table class='table table-bordered table-sm'>
                    <thead class='table-lightGray text-center'>
                        <th></th>
                        <th>No</th>
                        <th>제목</th>
                        <th>내용</th>
                        <th>작성일</th>
                    </thead>
                    <tbody class='text-center' id='notices'>
  						<!-- 공지사항 목록 -->
                    </tbody>
                </table>
            </div>
            <div class='d-flex justify-content-end'>
                <a type='button' class='btn btn-olive' href='#' id='fixNoticeBtn'>
                    <i class='bi bi-check-circle'></i>
                    &nbsp;수정
                </a>
            </div>
        </div>
   </div>
</div>
<footer></footer>
</body>
</html>