<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
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
<script src='../../res/modal.js'></script>
<script>
$.ajax({
	url: 'get',
	dataType: 'json',
	success: faqs => {
		$.each(faqs, (i, faq) => {
			if(faq.faqQuestion == `${param.faqQuestion}`){
				$('#questionInput').val(`\${faq.faqQuestion}`)
				$('#answerInput').val(`\${faq.faqAnswer}`)
			}
		})
	}	
})
$(() => {
$('#faqFixBtn').click(() => {
		let questionRegExp = /[가-힣ㄱ-ㅎa-zA-Z0-9\s]{5,30}/
	    if(questionRegExp.test($('#questionInput').val()) && $('#answerInput').val()){
	    	$.ajax({
	    		url: 'change',
	    		method:'post',
	    		data: {
	    			oldFaqQuestion: `${param.faqQuestion}`,
	    			newFaqQuestion: $('#questionInput').val(),
	    			newFaqAnswer: $('#answerInput').val()
	    		}
	    	})
	    	showOkModal('FAQ가 수정되었습니다.','adminFaqList')
	    } else if($('#questionInput').val() == '' && !$('#answerInput').val()) {
	    	showOkModal('제목과 내용을 입력해주세요.')
	    } else if(!$('#answerInput').val()){
	    	showOkModal('내용을 입력해주세요.')
	    } else if(!questionRegExp.test($('#questionInput').val())){
	    	showOkModal('제목을 5~30자의 영문, 한글, 숫자로 구성된 형태로 입력해주세요.')
	    }
})
	
$('#faqDelBtn').click(() => {
      showConfirmModal('FAQ를 삭제하시겠습니까?', 'FAQ가 삭제되었습니다.', 'adminFaqList')
      $('#okBtn').click(() => {
      	$.ajax({
      		url: 'del',
      		method: 'delete',
      		data: {
      			faqQuestion: `${param.faqQuestion}`
      		}
      	})
      })
   })
})
</script>
<title>FAQ수정</title>
<style>
    #contentBox{
        height: 20rem;
        resize: none;
    }
    textarea {
      resize: none;
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
                        <a class='border border-dark text-white p-2 mt-1' href='../admin/main' id='logo'>로고이미지</a>
                    </div>
                    <h1 class='text-center pt-3 text-white'><b>FAQ수정</b></h1>
                </div>
            </div>
        </div>
    </div>
    <div class='row'>
        <div class='col'>
            <div class='navigation fixed-top pt-2' id='subHeader'>
                <h6 class='text-white p-2'>
                    <a href='../admin/main'>메인</a> > <a href='../faq/adminFaqList'>FAQ</a> > <a href=''>FAQ수정</a>
                </h6>
            </div>
        </div>
    </div>
</header>
<div class='row' id='mainBody'>
    <div class='col'>
        <form class='mb-4'>
            <div class='row'>
                <div class='col pt-2 d-flex gap-3 mb-4'>
                    <label for='questionInput'>
                        <h5 class='align-items-center text-nowrap pt-1'>제목</h5>
                    </label>
                    <div class='col'>
                        <input id='questionInput' type='text' class='form-control'/>
                    </div>
                </div>
            </div>
            <div class='row'>
                <div class='col pt-2 d-flex gap-3 mb-4'>
                    <label for='answerInput'>
                        <h5 class='align-items-center text-nowrap pt-1'>내용</h5>
                    </label>
                    <div class='col'>
                        <textarea id='answerInput'class='form-control' rows='10' maxlength='300'></textarea>
                    </div>
                </div>
            </div>
            <div class='d-flex gap-2 justify-content-end'>
                <a type='button' class='btn btn-olive' id='faqFixBtn'>
                    <i class='bi bi-check-circle'></i>
                    &nbsp;수정
                </a>
                <a type='button' class='btn btn-lightRed' id='faqDelBtn'>
                    <i class='bi bi-x-circle'></i>
                    &nbsp;삭제
                </a>
            </div>
        </form>
   </div>
</div>
<footer>
</footer>
</body>
</html>