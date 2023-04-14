<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css' rel='stylesheet'/>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'/>
<link href='https://getbootstrap.com/docs/5.3/assets/css/docs.css' rel='stylesheet'/>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script>
function showLogo() {
	$.ajax({
		url: 'getLogos',
		method: 'get',
		dataType: 'json',
		success: logos => {
			if(logos.length) {
				$('#adminHeader').html(`
						<div class='float-start ms-4 mt-1' style='height: 50px;'>
		           			<a href='#'>
	                    		<img id='logo'/>
	                    	</a>
	                	</div>
	                	<h1 class='text-center pt-3 text-white'><b>MAIN</b></h1>`)
	                	
	        	$('img').attr('src', '<c:url value="/attach/' + logos.at(0).logoName + '"/>')
			} else {
				$('#adminHeader').html(`
						<div class='float-start m-4 ms-4'>
							<a  class='border border-dark text-white p-2 mt-1' href='#' id='logo'>
								로고이미지
							</a>
						</div>
						<h1 class='text-center pt-3 text-white'><b>MAIN</b></h1>`)
			}
		}
	})
}

$(() => {
	showLogo()
	
	$('#logoUp').change(() => {
		let formData = new FormData($('#logoUp')[0])
		$.ajax({
			url: 'addLogo',
			method: 'post',
			contentType : false,
	        processData : false,  
			data: formData,
			success: showLogo
		})
	})
	
	$.ajax({
		url: '../notice/get',
		method: 'get',
		dataType: 'json',
		success: notices => {
			let html = ''
			if(notices.length) {
				$.each(notices, (i, notice) => {
					if(i < 3) {
						html += `
							<li value='\${notice.noticeNum}'>
	                            <a href='../notice/fix?noticeNum=\${notice.noticeNum}'>
	                            	\${notice.noticeTitle}
	                            </a>
	                            <p></p>
	                            <p>작성일 \${notice.noticeDate}</p>
	                            <hr>
	                        </li>`
					}
				})
			} else {
				html += `<li>공지사항이 없습니다.</li>`
			}
			
			$('#noticeList').append(html)
		}
	})
	
	$.ajax({
		url: '../event/get',
		method: 'get',
		dataType: 'json',
		success: events => {
			let html = ''
			if(events.length) {
				$.each(events, (i, event) => {
					if(i < 3) {
						html += `
							<li value='\${event.eventNum}'>
	                            <a href='../event/fixEvent?eventNum=\${event.eventNum}'>
	                            	\${event.eventTitle}
	                            </a>
	                            <p></p>
	                            <p>작성일 \${event.eventDate}</p>
	                            <hr>
	                        </li>`
					}
				})
			} else {
				html += `<li>이벤트가 없습니다.</li>`
			}	
			$('#eventList').append(html)
		}
	})
})
</script>
<title>관리자메인</title>
<style>
    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }

    #mainBody {
        font-family: 'Pretendard-Regular';
        padding-top: 4rem;
    }

   #adminHeader{
        background-color:  lightslategray;
        z-index: 1;
        border-bottom: .2rem solid white;
        margin: 0 .7rem 0 .7rem;
   }

   #logo {
   		text-decoration: none;  
		max-width: 100%;
		height: 100%;
	}

    #navItem li {
        list-style-type: none;
    }

    .nav-link {
        text-decoration: none;
        color: white;
    }

    #navItem {
       width: 170px;
       height: 1000px;
       position: fixed;
       background-color: lightslategray;
    }

    #navItem a {
        text-decoration: none;  
        color: white;
    }

    #subBody{
        margin-left: 11.5rem;
    }

    .noticeList li{
        margin-left: .5rem;
        padding-right: 1rem;
    }

    .noticeList a{
        text-decoration: none;
        color: black;
    }

    .adminBody{
        box-shadow: .4rem .4rem .2rem 0rem lightgray;
    }

    input[type=file]::file-selector-button {
        width: 5rem;
        height: 2rem;
        color: white;
        background: lightslategray;
        border: .1rem solid lightslategray;
        border-radius: .3rem;
        cursor: pointer;
    }
</style>
</head>
<body id='mainBody'>
<div class='container-fluid'>
    <div class='row'>
        <div class='col'>
            <header>
                <div class='navigation fixed-top pt-2 pb-3' id='adminHeader'>
                
                </div>
            </header>
        </div>
    </div>
    <div class='row'>
      <div class='col-2'>
            <nav class='nav'>
                <div id='navItem'>
                    <ul class='mt-5'>
                        <li><a class='nav-link' href='logout'>로그아웃</a></li>
                        <li><a class='nav-link' href='userList'>회원목록</a></li>
                        <li><a class='nav-link' href='../tour/adminList'>상품목록</a></li>
                        <li class='mt-4 text-decoration-underline'>게시판</li>
                        <li><a class='nav-link' href='../review/adminList'>후기</a></li>
                        <li><a class='nav-link' href='../comment/adminList'>댓글</a></li>
                        <li><a class='nav-link' href='../notice/adminList'>공지사항</a></li>
                        <li><a class='nav-link' href='../event/adminList'>이벤트</a></li>
                        <li class='mt-4 text-decoration-underline'>고객센터</li>
                        <li><a class='nav-link' href='../faq/adminList'>FAQ</a></li>
                        <li><a class='nav-link' href='../report/adminList'>신고목록</a></li>
                    </ul>
                </div>
            </nav>
      </div>
      <div class='col-9 mt-4' id='subBody'>
            <div class='row'>
                <div class='col'>
                    <div class='border border-dark p-5 mt-3 text-center'>
                        <img style='max-width: 100%; max-height: 100%;'/>
                    </div>
                </div>
            </div>
            <div class='row'>
                <div class='col pt-2'>
	                <form id='logoUp'>
	                    <input type='file' name='logoImage' id='logoImage'/>
	                </form>
                </div>
            </div>
            <div class='row pt-5'>
                <div class='col noticeList'>
                    <div class='border border-dark rounded-3 pt-3 adminBody'>
                        <ol id='noticeList'><h5 class='pb-2'><b>공지사항</b></h5>
                        </ol>
                    </div>
                </div>
                <div class='col noticeList'>
                    <div class='border border-dark rounded-3 pt-3 adminBody'>
                        <ol id='eventList'><h5 class='pb-2'><b>이벤트</b></h5>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </div>
<footer></footer>
</body>
</html>
