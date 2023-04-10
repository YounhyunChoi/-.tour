<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
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
<title></title>
<<<<<<< HEAD
<script>
        $(() => {
        	 	
            let btnFunction = function (a) {
                a.click(() => {
                    if (a.hasClass('openBtn') && a.attr('aria-expanded') == 'true') {
                    	a.removeClass('openBtn')
                        a.addClass('closeBtn')
                        a.children().remove()
                        a.html("<span>닫기</span><i class='bi bi-caret-up-fill'></i>")
                       		                  
                    } else if (a.hasClass('closeBtn') && a.attr('aria-expanded') == 'false') {
                    	a.removeClass('closeBtn')
                        a.addClass('openBtn')
                        a.children().remove()
                        a.html("<span>열기</span><i class='bi bi-caret-down-fill'></i>")
                    }
                })
            }
            
            function listFaqs() {
            $.ajax({
        		url: 'faq/get',
        		dataType: 'json',
        		success: faqs => {
    		        if(faqs.length) {
    		            const faqArr = []        
    		            $.each(faqs, (i, faq) => {
    		                faqArr.push(
    		                    `<div class='row mt-3'>
    					            <div class='col'>
    					                <div class='card shadow-sm'>
    					                    <div class='card-header d-flex justify-content-between'>
    					                        <div class='faqQuestion'>
    					                        	\${faq.faqQuestion}
    					                        </div>
    					                        <button type='button' id='\${faq.faqQuestion}' class='faqBtn openBtn text-white border-0 rounded' 
    					                            data-bs-toggle='collapse' data-bs-target='#\${faq.faqQuestion}답변' aria-expanded='false'>
    					                            <span>열기</span>	
    					                            <i class='bi bi-caret-down-fill'></i>
    					                        </button>
    					                    </div>
    					                    <div id='\${faq.faqQuestion}답변' class='collapse'>
    					                        <div class='faqAnswer card-body bg-white'>
    					                        	\${faq.faqAnswer}
    					                        </div>
    					                    </div>
    					                </div>
    					            </div>
    					        </div>
            					<hr class='row mt-3'>`
    		                )
    		            })       
    		            $('#faqContainer').append(faqArr.join(''))	
 						$('hr').eq($('hr').length - 1).remove()
    		            $.each(faqs, (i, faq) => {
    		            	btnFunction($(`#\${faq.faqQuestion}`))
    		            })
    		        } else {
    		        	$('#faqContainer').html(`
    		        			<div class='row d-block my-5'>
    		                     <div class='col text-center pt-4'>
    		                         <h3 class='my-3'>
    		                             자주묻는 질문이 없습니다.
    		                         </h3>
    		                     </div>
    		                     <div class='col text-center mt-5'>
    		                         <button id='mypageBtn' type='button' class='px-5 py-2 border-0 rounded text-center text-white btn-darkBlue'
    		                            onclick="location.href='../user/mypage'">
    		                            마이 페이지로 가기
    		                         </button>
    		                     </div>
    		               </div>
    		        	`
    		        	)
    		        }
        		}
            })
        }     
            $(listFaqs)         
        })
                 
    </script>
=======
>>>>>>> branch 'master' of https://github.com/YounhyunChoi/-.tour.git
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
                    <div class='float-start m-4 ms-4'>
                        <a class='border border-dark text-white p-2 mt-1' href='../main.html' id='logo'>로고이미지</a>
                    </div>
                    <h1 class='text-center pt-3 text-white'><b>FAQ</b></h1>
                </div>
            </div>
        </div>
    </div>
   <div class='row'>
        <div class='col'>
            <div class='navigation fixed-top pt-2' id='subHeader'>
                <h6 class='text-white p-2'>
                    <a href='../main.html'>메인</a> > <a href='01.html'>FAQ</a>
                </h6>
            </div>
        </div>
    </div>
</header>
<div class='row' id='mainBody'>
    <div class='container mt-5 d-flex flex-column justify-content-center align-items-center text-center'>
        <div class='col-1 title form-control d-flex justify-content-center'>
            <b class='fs-1 text-white'>제목</b>
        </div>
        <div class='col-1 form-control d-flex justify-content-center '>
            <span class='fs-2 align-self-center' 
                   onclick="location.href='03.html'">
                   예약을 취소하고 싶어요.
            </span>
        </div>
        <div class='col-1 form-control d-flex justify-content-center'>
            <span class='fs-2  align-self-center' 
                  onclick="location.href='03.html'">
                  리뷰는 어떻게 등록할 수 있나요?
            </span>
        </div>
        <div class='col-1 form-control d-flex justify-content-center'>
            <span class='fs-2  align-self-center' 
                  onclick="location.href='03.html'">
                  아이디와 비밀번호를 잊었어요.
            </span>
        </div>
        <div class='col-1 form-control d-flex justify-content-end align-items-center border border-0 '>
            <button type='button' class='btn btn-darkBlue' 
                    onclick="location.href='02.html'">
                <i class='bi bi-plus-circle'></i>
                <span>등록</span>
            </button>
        </div>
    </div>
</div>
<footer>
</footer>
</body>
</html>