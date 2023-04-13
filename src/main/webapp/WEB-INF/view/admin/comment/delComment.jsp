<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css' rel='stylesheet'/>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'/>
<link href='https://getbootstrap.com/docs/5.3/assets/css/docs.css' rel='stylesheet'/>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<link href='../../res/adminStyle.css' rel='stylesheet'/>
<script src='../../res/adminNavigation.js'></script>
<script src='../../res/modal.js'></script>
<title></title>
<script>
    $(() => {
    	let commentArr = []
		commentArr.push(`
				<div class='row '>
			        <div class='col-3 border border-secondary p-2'>
			            <a>후기번호 `)   		
   		for(let i = '${comment.reviewNum}'.length; i < 4; i++)	{
			commentArr.push(`0`)
		} 
		commentArr.push(`${comment.reviewNum}</a>
			        </div>
			        <div class='col-9 border border-secondary p-2'>
			            <a>${comment.tourName}</a>
			        </div>
			    </div>
			    <div class='row'>
			        <div class='row shadow-sm mx-1 border border-lightGray mt-3'>`)
		if('${comment.reviewImageName}') {
			commentArr.push(`
					 <div class='col-4 p-0 reviewImage m-3 mx-1'>
						<img src='<c:url value="/attach/${comment.reviewImageName}"/>' style="max-width:100%; height:100%;"/>
					</div>`)
		}
		commentArr.push(`
		            <div class='col pe-0'>
		                <div class='row mt-1 text-end'>
		                    <h6>작성일 ${comment.reviewDate}</h6>
		                </div>
		                <div class='row mt-2'>
		                    <h5>제목 ${comment.reviewTitle}<br>
		                        평점`)
		for(let i = 0; i < 5; i++) {
			if(${comment.score - 1} >= 1) {
				commentArr.push(`<i class='bi bi-star-fill'></i>`)
			} else if(${comment.score - 1} == 0.5) {
				commentArr.push(`<i class='bi bi-star-half'></i>`)
			} else {
				commentArr.push(`<i class='bi bi-star'></i>`)
			}
		}                        
		commentArr.push(`<br>
		                        ${comment.reviewUserId}
		                    </h5>
		                </div>
		            </div>
		            <h3>${comment.reviewContent}</h3>
		        </div>
		    </div>
		    <div class='row'>
		        <div class='row shadow-sm mx-1 border border-lightGray mt-3' id='selectComt'>
		        	<div class='col-3 pt-3'>
                		<p class='mb-1'> 댓글번호 `)
   		for(let i = '${comment.comtNum}'.length; i < 4; i++)	{
			commentArr.push(`0`)
		} 
        commentArr.push(`${comment.comtNum}</p>
               	 		<h4>${comment.comtUserId}</h4>
            		</div>
            		<div class='col-4 text-start pt-4'>
                		<h3>${comment.comtContent}</h3>
            		</div>
            		<div class='col-4 text-end align-text-bottom pt-5'>
                		<h6 class='pt-4'>작성일 ${comment.comtDate}</h6>
            		</div>
            		<div class='col-1 d-flex justify-content-end'>
                		<a class='icon btn bi bi-x' id='delete'></a>
            		</div>
		        </div>
		    </div> `)
		    
		$('#mainBody').append(commentArr.join(''))
    	
        $('#delete').click(() => {
       		showConfirmModal('댓글을 삭제하시겠습니까?')
       		
       		$('#okBtn').click(() => {
           		$.ajax({
           			url: 'del/' + ${comment.comtNum},
           			method: 'delete',
           			success: () => {
           				$(location).attr('href', 'adminList')
           			}
           		})
       		})
        })
    })
</script>
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
                    <h1 class='text-center pt-3 text-white'><b>댓글조회</b></h1>
                </div>
            </div>
        </div>
    </div>
   <div class='row'>
        <div class='col'>
            <div class='navigation fixed-top pt-2' id='subHeader'>
                <h6 class='text-white p-2'>
                    <a href='../user/adminMain'>메인</a> > <a href='../comment/adminList'>댓글</a> > <a href=''>댓글조회</a>
                </h6>
            </div>
        </div>
    </div>
</header>
<div class='row' id='mainBody'>
     
</div>
<footer>
</footer>
</body>
</html>