<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<html>
<head>
   <meta charset='utf-8'>
   <meta name='viewport' content='width=device-width, initial-scale=1'>
   <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css' rel='stylesheet' />
   <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css' />
   <link href='https://getbootstrap.com/docs/5.3/assets/css/docs.css' rel='stylesheet' />
   <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
   <script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
   <link href='../res/style.css' rel='stylesheet' />
   <script>
      $(() => {
          sessionStorage.setItem("userId", "java01")
      })
  </script>
   <script src='../res/navigation.js'></script>
   <script src='../res/modal.js'></script>
   <title>USER.07 회원수정</title>
   <script>
      $(() => {
         $('#userFixBtn').click(() => {
            showConfirmModal('수정하시겠습니까?', '회원이 수정되었습니다.', '08.html')
         })
         $('#userDelBtn').click(() => {
            showConfirmModal('정말 탈퇴하시겠습니까?', '회원이 삭제되었습니다.', '09.html')
         })
         $('#phoneCertificationBtn').click(() => {
            showOkModal('인증번호가 발송되었습니다.')
         })
         $('#confirmBtn').click(() => {
            showOkModal('인증되었습니다.')
         })
      })
   </script>
   <style>
      .userBtn {
         width: 5rem;
         height: 2.5rem;
      }
   </style>
</head>
<body>
   <header>
   </header>
   <div class='navigation fixed-top'>
      <div class='float-start mt-2 ms-2'><i class='bi bi-caret-left-fill' onclick="location.href='./mypage.html'"></i></div>
      <div class='menuName'>
         <h2 class='text-center pt-3'><b>회원수정</b></h2>
      </div>
   </div>
   <div class='container mt-5 px-4'>
      <div class='row justify-content-center'>
         <div class='row d-flex flex-column'>
            <div class='row'>
               <div class='col-4'>아이디:</div>
               <div class='col-4'>java01</div>
            </div>
            <div class='row'>
               <div class='col-4'>이름:</div>
               <div class='col-4'>최영현</div>
            </div>
            <div class='row'>
               <div class='col-4'>생년월일:</div>
               <div class='col-4'>2004-05-05</div>
            </div>
         </div>
      </div>
      <div class='row mt-4 justify-content-center'>
         <div class='row d-flex flex-column'>
            <div class='row align-items-center'>
               <div class='col-4'><label for='password'>*비밀번호</label></div>
               <div class='col-8 p-0'><input type='password' class='form-control' placeholder='6~12자리의 영문,숫자' /></div>
            </div>
            <div class='row mt-3 align-items-center'>
               <div class='col-4'><label for='password'>*비밀번호 확인</label></div>
               <div class='col-8 p-0'><input type='password' class='form-control' placeholder='6~12자리의 영문,숫자' /></div>
            </div>
            <div class='row mt-3 align-items-center'>
               <div class='col-4'><label for='text'>*이메일</label></div>
               <div class='col-8 p-0'><input type='text' class='form-control'/></div>
            </div>
            <div class='row mt-2'>
               <div class='col'>
                  <label class='row'>
                     <div class='col d-flex justify-content-end align-items-center'>
                        <input type='checkbox'/>
                        <a>&nbsp; 마케팅 수신동의</a></div>
                  </label>
               </div>
            </div>
            <div class='row mt-3 align-items-center'>
               <div class='col-4'><label for='text'>*휴대폰번호</label></div>
               <div class='col-5 p-0'><input type='tel' class='form-control' /></div>
               <div class='col-3'>
                  <button type='submit' id='phoneCertificationBtn' class='btn btn-darkBlue form-control'
                     data-bs-toggle='modal' data-bs-target='#modal'>
                     <span>인증</span>
                  </button>
            </div>
            </div>
            <div class='row mt-3 align-items-center'>
               <div class='col-4'><label for='text'>*인증번호</label></div>
               <div class='col-5 p-0'><input type='number' class='form-control'/></div>
               <div class='col-3'>
                  <button type='submit' id='confirmBtn' class='btn btn-darkBlue form-control'
                     data-bs-toggle='modal' data-bs-target='#modal'>
                     <span>확인</span>
                  </button>
               </div>
            </div>
            <div class='row mt-4 d-felx flex-column'>
               <div class='col text-center'><a>*은 필수입력 사항입니다.</a></div>
               <div class='col mt-4 gap-2 d-flex justify-content-center'>
                  <button type='button' id='userFixBtn' 
                     class='userBtn btn btn-darkBlue border-0 rounded text-center text-white'
                     data-bs-toggle='modal' data-bs-target='#modal'>확인</button>
                  <button type='button' id='userDelBtn' 
                     class='userBtn btn btn-lightRed border-0 rounded text-center text-white'
                     data-bs-toggle='modal' data-bs-target='#modal'>회원탈퇴</button>
               </div>
            </div>
         </div>
      </div>
   </div>
   <div class='modal modal-center fade' id='modal'>
      <div class='modal-dialog modal-smallsize'>
          <div class='modal-content'>
              <div class='pb-4' id='modalMsg'></div>
              <div id='modalBtn'>
                  <button type='button' class='btn btn-lightGray' data-bs-dismiss='modal'>아니오</button>
                  <button type='button' class='btn btn-darkBlue' id='okBtn'>예</button>
              </div>
              <div id='modalOk'>
                  <a type='button' class='btn btn-darkBlue' data-bs-dismiss='modal'>확인</a>
              </div>
          </div>
      </div>
  </div>
<footer>
</footer>
</body>
</html>