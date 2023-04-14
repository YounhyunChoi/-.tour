<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css' rel='stylesheet'/>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'/>
<link href='https://getbootstrap.com/docs/5.3/assets/css/docs.css' rel='stylesheet'/>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<link href='../res/style.css' rel='stylesheet'/>
<script src='../res/navigation.js'></script>
<script src='../res/modal.js'></script>
<script>
$(() => {
	let reviewNum = ''
	for(let i = '${review.reviewNum}'.length; i < 4; i++) {
		reviewNum += '0'
	}
	
	$('#reviewNum').text('후기번호 ' + reviewNum + ${review.reviewNum})
	
	let scorehtml = '평점 '
	
	for(let i = 0; i < 5; i++) {
		if(${review.score} - i >= 1) {
			scorehtml += `<i class='bi bi-star-fill'></i>`
		} else if(${review.score} - i == 0.5) {
			scorehtml += `<i class='bi bi-star-half'></i>`
		} else {
			scorehtml += `<i class='bi bi-star'></i>`
		}
	}
	
	$('#score').html(scorehtml)
	
	$.ajax({
      url: 'getComments',
      method: 'get',
      data: {
         reviewNum: ${param.reviewNum}
      },
      success: comments => {
         if(comments.length) {
            $.each(comments, (i, comment) => {
               let commenthtml = `
                  <div class='container px-4 mt-4 shadow-sm'>
                      <div class='row border-bottom align-items-center border rounded-top'>
                          <div class='col-3'>
                              <div class='fs-3'>\${comment.userId}</div>
                          </div>
                          <div class='col-4'>
                              <div class='fs-6'>댓글번호 `
               for(let i = comment.comtNum; i < 4; i++) {
                  commenthtml += '0'
               }               
               commenthtml +=   `\${comment.comtNum}
               				</div>
                          </div>
                          <div class='col'>
                              <div class='dropdown float-end'>
                                  <a class='btn' type='button' 
                                  data-bs-toggle='dropdown' aria-expanded='false'>
                                      <i class='bi bi-three-dots-vertical justify-content-end'></i>
                                  </a>`
                                  
               if('${userId}' == comment.userId) {
                  commenthtml += `<ul class='dropdown-menu commentMenu p-0 border-olive'>
                                 <li><a class='dropdown-item btn border-olive' 
                                 href="../comment/fix?comtNum=\${comment.comtNum}&reviewNum=${review.reviewNum}">수정</a></li>
                              </ul>`
               } else {
                  commenthtml += `<ul class='dropdown-menu commentMenu p-0 border-lightRed'>
                                 <li class='border-bottom'><a class='dropdown-item btn'>신고</a></li>
                              </ul>`
               }
                  commenthtml += `</div>
                          </div>
                      </div>
                      <div class='row border-start border-end'>
                          <div class='col'>
                              <div class='fs-6'>
                                  \${comment.comtContent}
                              </div>
                          </div>
                      </div>
                      <div class='row border-start border-end rounded-bottom'>
                          <div class='col'>
                              <div class='fs-6 text-end'>
                                  \${comment.comtDate}
                              </div>
                          </div>
                      </div>
                  </div>`
               $(commenthtml).insertBefore('footer')
            })
         }
      }
   })
})
</script>
<title></title>
<style>
</style>
</head>
<body>
<header></header>
<div class='navigation fixed-top'>
    <div class='float-start mt-2 ms-2'><i class='bi bi-chevron-left' id='historyBtn'></i></div>
    <div class='menuName'>
        <h2 class='text-center pt-3'><b>후기 조회</b></h2>
    </div>
</div>
<div class='container'>
    <div class='row mx-2 mt-5 shadow-sm border'>
        <div class='col'>
            <div class='row align-items-center border-bottom'>
                <div class='col-4 fs-6' id='reviewNum'>
				</div>
                <div class='col fs-4'>${review.tourName}</div>
            </div>
            <div class='row mt-2'>
            	<c:if test='${reviewImageName != null}'>
            		<div class='col-4'>
	                    <div class='reviewImage'>
	                    	<img src='<c:url value="/attach/${reviewImageName}"/>'/>
	                    </div>
	                </div>
            	</c:if>
                <div class='col ms-2 fs-5 text-left'>
                    ${review.reviewTitle}<br>
                    <p class='mb-0' id='score'>
                    
                    </p>
                    ${review.userId}
                </div>
            </div>
            <div class='row'>
                <p class='text-end'>
                    작성일 ${review.reviewDate}
                </p>
            </div>
            <div class='row fs-5 px-3 pb-2'>
                ${review.reviewContent}
            </div>
        </div>
    </div>
</div>
<div class='container mt-4'>
    <div class='row justify-content-end'>
        <div class='col-3'>
            <a href='../comment/add?reviewNum=${param.reviewNum}' type='button' class='btn btn-darkBlue form-control'>
                <span>댓글쓰기</span>
            </a>
        </div>
        <div class='col-3'>
	        <c:if test='${review.userId == userId}'>
	            <a href='fix?reviewNum=${param.reviewNum}' type='button' class='btn btn-olive form-control'>
	                <span>수정하기</span>
	            </a>
	        </c:if>
	        <c:if test='${review.userId != userId}'>
	            <a type='button' class='btn btn-lightRed form-control'>
	                <span>신고하기</span>
	            </a>
	        </c:if>
        </div>
    </div>
</div>

<footer></footer>
</body>
</html>