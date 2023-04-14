<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
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
<title>FAQ목록</title>
<script>
$.ajax({
	url: 'get',
	dataType: 'json',
	success: faqs => {
		let faqQuestion
		if(faqs.length){	
			const faqArr = []
			$.each(faqs, (i, faq)=>{
				faqQuestion = `\${faq.faqQuestion}`
				faqArr.push(`
					<div class='row form-control d-flex justify-content-center'>
			            <span id='` + faqQuestion.replace(/ /gi, "") +  `' class='text-truncate fs-2 align-self-center'>
			                   \${faq.faqQuestion}
			            </span>
			        </div>`)
			})
			$('#faqContainer').append(faqArr.join(''))
			$.each(faqs, (i, faq) => {
				faqQuestion = `\${faq.faqQuestion}`.replace(/ /gi, "").replace(/\?/, "\\\?")
				$(`#\${faqQuestion}`).click(() => {
					location.href=`change?faqQuestion=\${faq.faqQuestion}`
				})
			})
		} else{
			$('#faqContainer').html(
				`
       			<div class='row d-block my-5'>
                   	<div class='col text-center pt-4'>
                       	<h3 class='my-3'>
                           	FAQ가 없습니다.
                       	</h3>
                   	</div>
             	</div>`)
		}
	}	
})
</script>
<style>
    .form-control {
        height: 5.2rem;
        border-radius: 0 !important;
    }
    .title{
        background-color: lightslategray
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
                    <h1 class='text-center pt-3 text-white'><b>FAQ</b></h1>
                </div>
            </div>
        </div>
    </div>
    <div class='row'>
        <div class='col'>
            <div class='navigation fixed-top pt-2' id='subHeader'>
                <h6 class='text-white p-2'>
                    <a href='../user/adminMain'>메인</a> > <a href='../faq/adminList'>FAQ</a>
                </h6>
            </div>
        </div>
    </div>
</header>
<div class='row' id='mainBody'>
    <div id='faqContainer' class='row container mt-5 justify-content-center align-items-center text-center'>
        <div class='row title form-control d-flex justify-content-center'>
            <b class='fs-1 text-white'>제목</b>
        </div>
    </div>
    <div class='row'>
    	<div class='form-control d-flex justify-content-end align-items-center border border-0 px-0'>
         <a id='faqAddBtn' type='button' class='btn btn-darkBlue' href='add'>
             <i class='bi bi-plus-circle'></i>
             <span>등록</span>
         </a>
         </div>
     </div>
</div>
<footer>
</footer>
</body>
</html>