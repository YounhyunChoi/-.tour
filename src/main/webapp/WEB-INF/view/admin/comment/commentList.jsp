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
<link href='../../res/adminStyle.css' rel='stylesheet'/>
<script src='../../res/adminNavigation.js'></script>
<script>
	function commentList() {
		$('#comments').empty()
		
		$.ajax({
			url: 'adminList',
			success: commentList => {
				if(commentList.length) {
					comments = []
					commentList.forEacg(comment => {
						comments.ufshift(
								`<tr>
			                    <td>\${comment.comtNum}</td>
			                    <td>\${comment.comtContent}</td>
			                    <td>\${comment.userId}</td>
			                    <td>\${comment.comtDate}</td>
			                    <td>
			                        <a href='../comment/02.html' class='btn btn-darkBlue'>보기</a>
			                    </td>
			                </tr>`)
					})
					
					$('#comments').append(comments.join(''))
				} else $('#comments').append(
						`<tr><td colspan='5' class='text-center'>댓글이 없습니다.</td></tr>`)
			}
		})
	}
</script>
<title></title>
<style>
    th,td {
        text-align: center;
        
    }
    #indexNum a {
        text-decoration: none;
        color: black;
    }
</style>
</head>
<body>
<header>
    <div class='container-fluid'>
        <div class='row'>
            <div class='col'>
                <div class='navigation fixed-top pt-2 pb-3' id='adminHeader'>
                    <div class='float-start m-4 ms-4'><a  class='border border-dark text-white p-2 mt-1' href='../main.html' id='logo'>로고이미지</a></div>
                    <h1 class='text-center pt-3 text-white'><b>댓글</b></h1>
                </div>
            </div>
        </div>
    </div>
   <div class='row'>
        <div class='col'>
            <div class='navigation fixed-top pt-2' id='subHeader'>
                <h6 class='text-white p-2'>
                    <a href='#'>메인</a> > <a href='./01.html'>댓글</a>
                </h6>
            </div>
        </div>
    </div>
</header>
<div class='row' id='mainBody'>
    <div class='row'>
        <div class='col-2 pt-2'>
            <select class='form-select'>
                <option>댓글번호</option>
                <option>댓글내용</option>
                <option>아이디</option>
            </select>
        </div>
        <div class='col-8 pt-2'>
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
        <table class='table mt-3 table-bordered border-lighGray table-sm'>
            <thead class='table-lightGray'>
                <tr>
                    <th>댓글번호</th>
                    <th>댓글내용</th>
                    <th>아이디</th>
                    <th>작성일</th>
                    <td></td>
                </tr>
            </thead>
            <tbody class='align-middle' id='comments'>
                
            </tbody>
        </table>
    </div>
    <nav aria-label='Page navigation example'>
        <ul class='pagination d-flex justify-content-center  mt-5' id='indexNum'>
            <li class='page-item'>
                <a class='page-link' href='#' aria-label='Previous'>
                    <span aria-hidden='true'>&laquo;</span>
                </a>
            </li>
            <li class='page-item'>
                <a class='page-link' href='#' aria-label='Previous'>
                    <span aria-hidden='true'>&lsaquo;</span>
                </a>
            </li>
            <li class='page-item'><a class='page-link' href='#'>1</a></li>
            <li class='page-item'><a class='page-link' href='#'>2</a></li>
            <li class='page-item'><a class='page-link' href='#'>3</a></li>
            <li class='page-item'><a class='page-link' href='#'>4</a></li>
            <li class='page-item'><a class='page-link' href='#'>5</a></li>
            <li class='page-item'>
                <a class='page-link' href='#' aria-label='Next'>
                    <span aria-hidden='true'>&rsaquo;</span>
                </a>
            </li>
            <li class='page-item'>
                <a class='page-link' href='#' aria-label='Next'>
                    <span aria-hidden='true'>&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>
<footer>
</footer>
</body>
</html>