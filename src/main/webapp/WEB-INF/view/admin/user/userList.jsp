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
<script>
$(() => {
	$.ajax({
		url: 'getUsers',
		dataType: 'json',
		success: users => {
			let html = ''
			if(users.length) {
				$.each(users, (i, user) => {
					html += `<tr>
                    <td>\${user.userId}</td>
                    <td>\${user.userName}</td>
                    <td>\${user.email}</td>
                    <td>\${user.phoneNum}</td>
                    <td>
                        <div class='d-grid gap-2 justify-content-center'>
                            <a href='adminFix?userId=\${user.userId}' class='btn btn-olive'>
                                <span>수정</span>
                            </a>
                            <a href='../reservation/del?userId=\${user.userId}' class='btn btn-darkBlue'>
                                <span>예약보기</span>
                            </a>
                        </div>
                    </td>
                </tr>`
				})
			} else {
				html += `<td colspan=5 class=text-center>사용자가 없습니다.</td>`
			}

			$('tbody').append(html)
		}
	})
})
</script>
<title></title>
<style>
   td {
    word-break: break-all
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
                    <h1 class='text-center pt-3 text-white'><b>회원목록</b></h1>
                </div>
            </div>
        </div>
    </div>
   <div class='row'>
        <div class='col'>
            <div class='navigation fixed-top pt-2' id='subHeader'>
                <h6 class='text-white p-2'>
                    <a href='adminMain'>메인</a> > <a href='#'>회원목록</a>
                </h6>
            </div>
        </div>
    </div>
</header>
<div class='row' id='mainBody'>
    <div class='col'>
        <div class='row'>
            <div class='col-2 pt-2 mt-1 text-end'>
                <h4 class='text-nowrap'>회원조회</h4>
            </div>
            <div class='col-2 pt-2'>
                <select class='form-select'>
                    <option>이름</option>
                    <option>이메일</option>
                    <option>아이디</option>
                    <option>휴대폰번호</option>
                </select>
            </div>
            <div class='col-6 pt-2'>
                <input type='text' class='form-control'/>
            </div>
            <div class='col-2'>
                <form>
                    <div>
                        <a type='button' class='btn w-auto'>
                            <i class="icon bi bi-search"></i>
                        </a>
                    </div>
                </form>
            </div>
        </div>
        <div class='row'>
            <div class='col'>
                <table class='table mt-3 table-bordered table-sm'>
                    <thead class='table-lightGray text-center'>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>이메일</th>
                        <th>휴대폰번호</th>
                        <td></td>
                    </thead>
                    <tbody class='align-middle text-center'>
                        
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<footer>
</footer>
</body>
</html>