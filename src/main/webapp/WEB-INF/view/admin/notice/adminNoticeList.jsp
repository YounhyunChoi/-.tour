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
<title>ADMIN.NOTICE.01 공지 목록</title>
<script>
$(() => {	
	$('#fixNoticeBtn').click(() => {
		if($('#noticeNum:checked').val()){
			$('#fixNoticeBtn').attr('href', '../notice/fixNotice?noticeNum=' + $('#noticeNum:checked').val())
		}		
	})
	
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
	                            <td>\${notice.noticeContent}</td>
	                            <td>\${notice.noticeDate}</td>
                        	</tr>`
                       )
				})
				$('#notices').append(noticeArr.join(''))
			} else $('#notices').append(
					'<tr><td colspan=5 class=text-center>등록된 공지사항이 없습니다.</td></tr>')
		}
	})
})
</script>
</head>
<body>
<header>
    <div class='container-fluid'>
        <div class='row'>
            <div class='col'>
                <div class='navigation fixed-top pt-2 pb-3' id='adminHeader'>
                    <c:if test='${logoName != null}'>
	                    <div class='float-start ms-4 mt-1' style='height: 50px;'>
		           			<a href='../admin/main'>
	                    		<img id='logo'/>
	                    	</a>
                    	</div>
					</c:if>
					<c:if test='${logoName == null}'>
						<div class='float-start m-4 ms-4'>
							<a  class='border border-dark text-white p-2 mt-1' href='../admin/main' id='logo'>
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
                    <a href='../admin/main'>메인</a> > <a href='../notice/adminList'>공지사항</a>
                </h6>
            </div>
        </div>
    </div>
</header>
<div class='row' id='mainBody'>
   <div class='col'>
        <form class='mb-4'>
            <div class='row'>
                <div class='col-6 pt-2'>
                    <input type='text' class='form-control'/>
                </div>
                <div class='col'>
                    <a href='#' type='button' class='btn'><i class='icon bi bi-search'></i></a>
                </div>
                <div class='col'>
                    <div class='d-flex justify-content-end'>
                        <a type='button' class='btn btn-darkBlue' id='addNoticeBtn' href='addNotice'>
                            <i class='bi bi-plus-circle'></i>&nbsp;새글
                        </a>
                    </div>
                </div>
            </div>
        </form>
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
            <nav aria-label='Page navigation example'>
                <ul class='pagination d-flex justify-content-center  mt-5' id='indexNum'>
                    <li class='page-item'>
                        <a class='page-link' href='#' aria-label='Previous'>
                            <span aria-hidden='true'>&laquo;</span>
                        </a>
                    </li>
                    <li class='page-item'>
                        <a class='page-link' href='#' aria-label='Previous'>
                            <span aria-hidden='true'>&lsaquo;</span>
                        </a>
                    </li>
                    <li class='page-item'><a class='page-link' href='#'>1</a></li>
                    <li class='page-item'>
                        <a class='page-link' href='#' aria-label='Next'>
                            <span aria-hidden='true'>&rsaquo;</span>
                        </a>
                    </li>
                    <li class='page-item'>
                        <a class='page-link' href='#' aria-label='Next'>
                            <span aria-hidden='true'>&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
   </div>
</div>
<footer>
</footer>
</body>
</html>