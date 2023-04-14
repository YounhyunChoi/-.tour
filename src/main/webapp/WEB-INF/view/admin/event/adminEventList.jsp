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
$(() => {
	$('#fixEventBtn').click(() => {
		if($('#eventNum:checked').val()) {
			$('#fixEventBtn').attr('href', '../event/fix?eventNum=' + $('#eventNum:checked').val())
		}		
	})
	
	$.ajax({
		url: 'get',
		dataType: 'json',
		success: events => {
			if(events.length){
				const eventArr = []
				
				$.each(events, (i, event) => {
					eventArr.push(
						`<tr>
                            <td class='align-middle'>
                            	<input type='radio' id='eventNum' name='eventHeader' value='\${event.eventNum}'/>
                            </td>
                            <td>\${event.eventNum}</td>
                            <td>\${event.eventTitle}</td>
                            <td>\${event.eventContent}</td>
                            <td>\${event.eventDate}</td>
                        </tr>`)
				})
				$('#events').append(eventArr.join(''))
			} else {
				$('#events').append(
						'<tr><td colspan=5 class=text-center>등록된 이벤트가 없습니다.</td></tr>')
			}
		}
	})
})
</script>
<title>이벤트목록</title>
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
                	<h1 class='text-center pt-3 text-white'><b>이벤트목록</b></h1>
                </div>
            </div>
        </div>
    </div>
    <div class='row'>
        <div class='col'>
            <div class='navigation fixed-top pt-2' id='subHeader'>
                <h6 class='text-white p-2'>
                    <a href='../user/adminMain'>메인</a> > <a href='../event/adminList'>이벤트목록</a>
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
                    <input type='text' class='form-control'/>
                </div>
                <div class='col'>
                    <a href='#' type='button' class='btn'><i class='icon bi bi-search'></i></a>
                </div>
                <div class='col'>
                    <div class='d-flex justify-content-end'>
                        <a type='button' class='btn btn-darkBlue' href='add'>
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
                    <tbody class='text-center' id='events'>
                        <!-- 이벤트 목록 -->
                    </tbody>
                </table>
            </div>
            <div class='d-flex justify-content-end'>
                <a type='button' class='btn btn-olive' id='fixEventBtn'>
                    <i class='bi bi-check-circle'></i>
                    &nbsp;수정
                </a>
            </div>
        </div>
   </div>
</div>
<footer>
</footer>
</body>
</html>