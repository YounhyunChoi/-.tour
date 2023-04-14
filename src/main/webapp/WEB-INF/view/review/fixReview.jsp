<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css' rel='stylesheet'/>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'/>
<link href='https://getbootstrap.com/docs/5.3/assets/css/docs.css' rel='stylesheet'/>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<link href='../res/style.css' rel='stylesheet'/>
<script src='../res/navigation.js'></script>
<script src='../res/modal.js'></script>
<title>fixReview</title>
<script>
$(() => {
   $('#reviewTitle').val(${review.reviewTitle})
   $('#reviewContent').val(${review.reviewContent})
   $('#rangeScore').val(${review.score})
   selectScore()
   
    $('#reviewFixBtn').click(() => {  
       let regexr = /[a-zA-Z가-힣0-9]{5}/
       
          if(regexr.test($('#reviewTitle').val()) && $('#reviewContent').val()) {
             $.ajax({
                url: 'fix',
                method: 'put',
                contentType:'application/json',
                data: JSON.stringify({
                   	reviewNum: ${review.reviewNum},
                     reviewTitle: $('#reviewTitle').val(),
                     reviewContent: $('#reviewContent').val(),
                     score: $('#rangeScore').val()
                    }),
                success: () => {
                   let formData = new FormData($('#reviewImageUp')[0])
                   
                   $.ajax({
                      url: 'addReviewImages',
                      method: 'post',
                      contentType: false,
                      processData: false,
                      data: formData,
                      success: isGood => {
                         $(location).attr('href', 'my')  
                      }
                   })
                }
             })
          } else {
             showOkModal('제목이 5자리 미만이거나 특수문자가 포함되어 있습니다.')
          }
    })
    
    $('#reviewDelBtn').click(() => {
            showConfirmModal('후기를 삭제하시겠습니까?')
            
            $('#okBtn').click(() => {
               $.ajax({
                  url: 'del/' + ${param.reviewNum},
                  method: 'delete',
                  success: () => {
                	  $(location).attr('href', 'my')
                  }
               })
            })
        })
    
    $('#rangeScore').change(selectScore)
})

function selectScore() {
   let html = ''
       
      for(let i = 0; i < 5; i++) {
      if($('#rangeScore').val() - i >= 1) {
         html += `<i class='bi bi-star-fill'></i>`
      } else if($('#rangeScore').val() - i == 0.5) {
         html += `<i class='bi bi-star-half'></i>`
      } else {
         html += `<i class='bi bi-star'></i>`
      }
   }
      
      $('#starScore').html(html)
}
</script>
<style>
    .contentBtn {
        width: 68px;
        height: 38px;
    }
    
    #starScore {
       position: absolute;
       right: 25px;
       width: 131.5px;
    }
    
    #rangeScore {
       position: absolute;
       right: 14.2px;
       width: 152.8px;
       opacity: 0;
    }
</style>
</head>
<body>
<header>
</header>
<div class='navigation fixed-top'>
   <div class='float-start mt-2 ms-2'><i class='bi bi-chevron-left' onclick="location.href='../review/05.html'"></i></div>
   <div class='menuName'>
      <h2 class='text-center pt-3'><b>후기 수정</b></h2>
   </div>
</div>
<div class='container mt-4 px-4 text-center'>
    <div class='row mb-3 d-flex justify-content-between'>
        <div class='col-2 text-end text-nowrap'><b class='fs-4'>제목</b></div>
        <div class='col-10'>
            <input id='reviewTitle' type='text' maxlength='30' class='form-control shadow-sm'>
        </div>
    </div>
    <div class='row mb-3 d-flex justify-content-between'>
        <div class='col-2 text-end text-nowrap'><b class='fs-4'>내용</b></div>
        <div class='col-10'>
            <textarea id='reviewContent' maxlength='300' rows='10' class='form-control'></textarea>
        </div>
    </div>
    <div class='row mb-2'>
        <div class='col-2'></div>
        <div class='col-4 text-start'>
           <form id='reviewImageUp' class='mb-0'>
               <input type='file' id='inputImg' name='reviewImage' class='d-none'>
            </form>
            <button type='button'
                class='contentBtn border-0 btn-lightGray rounded text-white'>
                <label for='inputImg'>사진추가</label>
            </button>
        </div>
        <div class='col-2 d-flex justify-content-end p-0 fs-4'
           style='padding-top: 0.19rem! important;'>
              평점
        </div>
        <div class='col d-flex align-items-center fs-4'>
             <span id='starScore' class='d-flex justify-content-between'>
             </span>
             <input type='range' value='0.5' step='0.5' min='0.5' max='5' id='rangeScore'/>
        </div>
    </div>
    <div class='row'>
        <div class='col text-end'>
            <button type='button' id='reviewDelBtn' 
                class='me-4 contentBtn border border-0 rounded btn-lightRed text-white'>
                삭제
            </button>
            <button type='button' id='reviewFixBtn' 
                class='contentBtn border border-0 rounded btn-olive text-white'>
                수정
            </button>
        </div>
    </div>
</div>
<footer>
</footer>
</body>
</html>