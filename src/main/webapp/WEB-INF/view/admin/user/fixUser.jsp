<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
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
<script>
$(() => {
	$.ajax({
		url: 'getUser',
		data: {
			userId: `${param.userId}`
		},
		success: users => {
			let user = users.at(0)
			$('#userName').val(user.userName)
			$('#birthday').val(user.birthday)
			$('#userPw').val(user.userPw)
			$('#email').val(user.email)
			if(user.mktgAgreement == "Y") {
				$('#emailAgree input').prop("checked", true)
			}
			$('#phoneNum').val(user.phoneNum)
		}
	})
	
	$('#fixUserBtn').click(() => {
		let nameRegexr = /[가-힣]{3}/
		let passwordRegexr = /[a-z0-9]{6}/
		let emailRegexr = /[a-z0-9]+@[a-z]+\.[a-z]{2,3}/
		let phoneNumRegexr = /[0-9]{10}/
		
		if(nameRegexr.test($('#userName').val()) && $('#birthday').val() &&
				passwordRegexr.test($('#userPw').val()) && emailRegexr.test($('#email').val()) &&
				phoneNumRegexr.test($('#phoneNum').val())) {
			
			let mktg = $('#mktgAgreement').is(':checked') ? 'Y' : 'N'
				
    		$.ajax({
    			url: 'fixUser',
    			method: 'put',
    			contentType: 'application/json',
    			data: JSON.stringify({
    				userId: '${param.userId}',
    				userName: $('#userName').val(),
    				userPw: $('#userPw').val(),
    				email: $('#email').val(),
    				phoneNum: $('#phoneNum').val(),
    				mktgAgreement: mktg
    			}),
    			success: () => {
    				$(location).attr('href', 'userList')
    			}
    		})
		} else {
			showOKModal('누락된 필수 입력사항이 있습니다.')
		}
	})
	
	$('#delUserBtn').click(() => {
		showConfirmModal('삭제하시겠습니까?', 'userList')
		
		$('#okBtn').click(() => {
    		$.ajax({
    			url: 'delUser/${param.userId}',
    			method: 'delete'
    		})
    	})
	})
})
</script>
<title></title>
<style>
    #emailAgree {
        float: right;
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
							<a class='border border-dark text-white p-2 mt-1' href='../user/adminMain' id='logo'>
								로고이미지
							</a>
						</div>
					</c:if>
                    <h1 class='text-center pt-3 text-white'><b>회원수정</b></h1>
                </div>
            </div>
        </div>
    </div>
    <div class='row'>
        <div class='col'>
            <div class='navigation fixed-top pt-2' id='subHeader'>
                <h6 class='text-white p-2'>
                    <a href='adminMain'>메인</a> > <a href='userList'>회원목록</a> > <a href='#'>회원수정</a>
                </h6>
            </div>
        </div>
    </div>
</header>
<div class='row' id='mainBody'>
    <div class='col'>
        <div class='row fs-5'>
            <div class='col-1'></div>
            <div class='col-2 text-nowrap'>아이디:</div>
            <div class='col-9 text-center'>${param.userId}</div>
        </div>
        <form>
            <div class='row text-center'>
                <div class='col-4 table-lightGray border text-black pt-1'>
                    이름 
                </div>
                <div class='col-7 border border-start-0 p-0'>
                    <input type='text' class='w-100' id='userName' maxlength='5'>
                </div>
                <div class='col-1'></div>
            </div>
            <div class='row text-center'>
                <div class='col-4 table-lightGray border border-top-0 text-black pt-1'>
                    생년월일 
                </div>
                <div class='col-7 border border-top-0 border-start-0 p-0'>
                    <input type='date' class='w-100' id='birthday'>
                </div>
                <div class='col-1'></div>
            </div>
            <div class='row text-center'>
                <div class='col-4 table-lightGray border border-top-0 text-black pt-1'>
                    비밀번호 
                </div>
                <div class='col-7 border border-top-0 border-start-0 p-0'>
                    <input type='text' class='w-100' id='userPw' maxlength='12'>
                </div>
                <div class='col-1'></div>
            </div>
            <div class='row text-center'>
                <div class='col-4 table-lightGray border border-top-0 text-black pt-1'>
                    이메일 
                </div>
                <div class='col-7 border border-top-0 border-start-0 p-0'>
                    <input type='text' class='w-100' id='email'>
                </div>
                <div class='col-1'></div>
            </div>
            <div class='row text-center'>
                <div class='col-11 border border-top-0 p-0'>
                    <div class='pe-2' id='emailAgree'>
                        <input type='checkbox'/> 마케팅 수신동의
                    </div>
                </div>
            </div>
            <div class='row text-center'>
                <div class='col-4 table-lightGray border border-top-0 text-black pt-1'>
                    휴대폰번호
                </div>
                <div class='col-7 border border-top-0 border-start-0 p-0'>
                    <input type='text' class='w-100' id='phoneNum' maxlength='11'>
                </div>
                <div class='col-1'></div>
            </div>
            <div class='row mt-4 gap-3'>
                <div class='col-7'></div>
                <div class='col d-flex gap-2 justify-content-center'>
                    <button type='button' class='btn btn-olive' id='fixUserBtn'>
                        <i class='bi bi-check-circle'></i>수정
                    </button>
                    <button type='button' class='btn btn-lightRed' id='delUserBtn'>
                        <i class='bi bi-x-circle'></i>삭제
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
<footer>
</footer>
</body>
</html>