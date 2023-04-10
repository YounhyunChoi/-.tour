<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css' rel='stylesheet' />
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css' />
<link href='https://getbootstrap.com/docs/5.3/assets/css/docs.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<link href='../res/style.css' rel='stylesheet' />
<script src='../res/navigation.js'></script>
<title></title>
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
<style>
    .card {
        background-color: lightblue;
    }

    .openBtn {
        background-color: #287094;
    }

    .closeBtn {
        background-color: #d21412;
    }

    hr {
        color: black;
        opacity: 1;
    }
</style>

</head>

<body>
    <header>
    </header>
    <div class='navigation fixed-top'>
        <div class='float-start mt-2 ms-2'><i class='bi bi-caret-left-fill' onclick="location.href='../main'"></i></div>
        <div class='menuName'>
            <h2 class='text-center pt-3'><b>자주묻는질문</b></h2>
        </div>
    </div>
    <div id='faqContainer' class='container mt-5'>
        
    </div>
    <footer>
    </footer>
</body>

</html>