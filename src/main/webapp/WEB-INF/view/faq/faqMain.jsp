<%@ page language='java' contentType='text/html; charset=utf-8'
	pageEncoding='utf-8'%>
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link
	href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css'
	rel='stylesheet' />
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css' />
<link href='https://getbootstrap.com/docs/5.3/assets/css/docs.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<link href='../res/style.css' rel='stylesheet' />
<script src='../res/navigation.js'></script>
<title></title>
<script>
        $(() => {
        	
        	
 
        	
            let btnFunction = function (a) {
                a.click(() => {
                    if (a.hasClass('openBtn')) {
                    	 a.removeClass('openBtn')
                         a.addClass('closeBtn')
                        a.children().remove()
                        a.html("<span>닫기</span><i class='bi bi-caret-up-fill'></i>")
                       		                  
                    } else if (a.hasClass('closeBtn')) {
                    	a.removeClass('closeBtn')
                        a.addClass('openBtn')
                        a.children().remove()
                        a.html("<span>열기</span><i class='bi bi-caret-down-fill'></i>")
                    }
                })
            }
            
            function listFaqs() {
            	let replaceClass = function(a, b, c) {
                    a.removeClass(`${b}`)
                    a.addClass(`${c}`)
                }
            	
            	
            $.ajax({
        		url: 'faq/get',
        		dataType: 'json',
        		success: faqs => {
    		        if(faqs.length) {
    		            const faqArr = []
    		            const faqSeqArr = []
    		           
    		            
    		            $.each(faqs, (i, faq) => {

  						if((faqs.length - i) > 1){
    		                faqArr.push(
    		                    `<div class='row mt-3'>
    					            <div class='col mt-3'>
    					                <div class='card shadow-sm'>
    					                    <div class='card-header d-flex justify-content-between'>
    					                        <div class='faqQuestion'>
    					                        	\${faq.faqQuestion}
    					                        </div>
    					                        <button type='button' id='faqBtn\${++i}' class='faqBtn openBtn text-white border-0 rounded' 
    					                            data-bs-toggle='collapse' data-bs-target='#faqContent\${i}'>
    					                            <span>열기</span>
    					                            <i class='bi bi-caret-down-fill'></i>
    					                        </button>
    					                    </div>
    					                    <div id='faqContent\${i}' class='collapse'>
    					                        <div class='faqAnswer card-body bg-white'>
    					                        	\${faq.faqAnswer}
    					                        </div>
    					                    </div>
    					                </div>
    					            </div>
    					        </div>
            					<hr class='row mt-3'>`
    		                )
    		            } else if((faqs.length - i) == 1) {
    		            	faqArr.push(
        		                    `<div class='row mt-3'>
        					            <div class='col mt-3'>
        					                <div class='card shadow-sm'>
        					                    <div class='card-header d-flex justify-content-between'>
        					                        <div class='faqQuestion'>
        					                        	\${faq.faqQuestion}
        					                        </div>
        					                        <button type='button' id='faqBtn\${++i}' class='faqBtn openBtn text-white border-0 rounded' 
        					                            data-bs-toggle='collapse' data-bs-target='#faqContent\${i}'>
        					                            <span>열기</span>
        					                            <i class='bi bi-caret-down-fill'></i>
        					                        </button>
        					                    </div>
        					                    <div id='faqContent\${i}' class='collapse'>
        					                        <div class='faqAnswer card-body bg-white'>
        					                        	\${faq.faqAnswer}
        					                        </div>
        					                    </div>
        					                </div>
        					            </div>
        					        </div>
                				`
        		                )
    		            }
    		              faqSeqArr.push(i)
    		            })
    		            
    		            $('#faqContainer').append(faqArr.join(''))
    		         	
    		            $.each(faqSeqArr, (i, seqNum) => {
    		            	btnFunction($(`#faqBtn\${seqNum}`))
    		            })
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
	<header> </header>
	<div class='navigation fixed-top'>
		<div class='float-start mt-2 ms-2'>
			<i class='bi bi-caret-left-fill'
				onclick="location.href='../main.html'"></i>
		</div>
		<div class='menuName'>
			<h2 class='text-center pt-3'>
				<b>자주묻는질문</b>
			</h2>
		</div>
	</div>
	
	<div id='faqContainer' class='container mt-5'></div>
	<footer> </footer>
</body>

</html>