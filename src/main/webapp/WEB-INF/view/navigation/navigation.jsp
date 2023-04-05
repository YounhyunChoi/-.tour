<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%
	String userId = (String)session.getAttribute("userId");
%>
<div class='container' id='header'>
    <div class='row' id='navbarHeader'>
        <nav class='navbar fixed-top' id='navbarHeader'>
            <div class='container-fluid'>
            	<a class='navbar-brand mb-2 border border-dark' href='/'>로고이미지</a>            	
	            <div>
<%
				if(userId == null) {
%>            	
	                <span><a class='btn btn-darkBlue' href='../user/login'>로그인</a></span>
<%
				} else {
%>	                
                	<span class='pt-2'><%= userId %>님</span>
                	<span class='dropdown'>
	                  	<a class='btn' type='button' 
	                  	data-bs-toggle='dropdown' aria-expanded='false'>
	                     	<i class='icon bi bi-bell-fill justify-content-end'></i>
	                  	</a>
	                  	<ul class='dropdown-menu dropdown-menu-end alarm'>
	                     	<li class='border-bottom'>
	                        	<div class='row'>
	                           		<div class='col-10'>
	                              		<a class='dropdown-item alarm-item' href='#'>
	                                 		여행 취소 환불 완료됐습니다.
	                              		</a>
	                           		</div>
		                           	<div class='col-2 ps-0 pt-1'>
		                              	<a type='button' class='btn-close'></a>
		                           	</div>
	                        	</div>
	                     	</li>
		                    <li class='border-bottom'>
		                        <div class='row'>
		                           	<div class='col-10'>
		                              	<a class='dropdown-item alarm-item' href='#'>
		                                 	신고한 게시글이 삭제됐습니다.
		                              	</a>
		                           	</div>
		                           	<div class='col-2 ps-0 pt-1'>
		                              	<a type='button' class='btn-close'></a>
		                           	</div>
		                        </div>
		                    </li>
	                  	</ul>
	               	</span>
<%
				}
%>                	
	                <button class='navbar-toggler' type='button' data-bs-toggle='offcanvas' 
	                    data-bs-target='#offcanvasNavbar' aria-controls='offcanvasNavbar'>
	                    <span class="navbar-toggler-icon"></span>
	                </button>
	            </div>
	        </div>
        </nav>
    </div>
    <div class='offcanvas offcanvas-end' tabindex='-1' id='offcanvasNavbar' 
    aria-labelledby='offcanvasNavbarLabel'>
    	<div class='offcanvas-header'>
        	<h5 class='offcanvas-title' id='offcanvasNavbarLabel'>최영현여행</h5>
            <button type='button' class='btn-close' data-bs-dismiss='offcanvas'  
            aria-label='Close'></button>
        </div>
        <div class='offcanvas-body'>
            <ul class='navbar-nav justify-content-end flex-grow-1 pe-3'>
<%
			if(userId != null) {
%>	                        
                <li class='nav-item'>
	                <ul>
	                    <li>
	                        <a class='nav-link' aria-current='page' href='../user/logout'>로그아웃</a>
	                    </li>
	                </ul>
	            </li>
	            <br>
	            <li class='nav-item'>
	                마이페이지
	                <ul>
	                    <li>
	                        <a class='nav-link' aria-current='page' href='../'>예약내역</a>
	                    </li>
	                    <li>
	                        <a class='nav-link' aria-current='page' href='../'>찜 내역</a>  
	                    </li>
	                    <li>
	                        <a class='nav-link' aria-current='page' href='../'>내가 쓴 후기</a> 
	                    </li>
	                </ul>
	            </li>    
                <br>
<%
			}
%>	                  
                <li class='nav-item'>
                    여행
                    <ul>
                        <li>
                            <a class='nav-link' aria-current='page' href='/tour'>코스보기</a>
                            <a class='nav-link' aria-current='page' href='#'>후기</a>
                        </li>
                    </ul>
                </li>
                <br>
                <li class='nav-item'>
                    <ul>
                        <li>
                            <a class='nav-link' aria-current='page' href='#'>이벤트</a>
                        </li>
                    </ul>
                </li>
                <br>
                <li class='nav-item'>
                    <ul>
                        <li>
                            <a class='nav-link' aria-current='page' href='#'>공지사항</a>
                        </li>
                    </ul>
                </li>
                <br>
                <li class='nav-item'>
                    고객센터
                    <ul>
                        <li>
                            <a class='nav-link' aria-current='page' href='#'>1대1문의</a>
                            <a class='nav-link' aria-current='page' href='/faq'>FAQ</a>
                        </li>
                    </ul>
                </li>
                <br><br>
                <li class='nav-item pb-5'>
                    <ul>
                        <li class='pb-5'>
                            상호명 : (주)이젠여행<br>
                            대표이사 : 최영현<br>
                            서울특별시 관악구 신림로 340<br>
                            사업자 등록번호 : 123-45-0067
                        </li>
                    </ul>
                </li>                      
            </ul>
        </div>
    </div>
</div>
<div class='row' id='footer'>
    <div class='col'>
        <div class='navbar nav-item fixed-bottom mb-0 list-style-none' id='navbarFooter'>
            <div class='ps-2'>
                <a href='#' class='btn w-auto' type='button'>
                    <i class='icon bi-geo-alt-fill fa-3x'></i>
                </a>
            </div>
            <div class='d-flex justify-content-center'>
                <a href='/' class='btn w-auto' type='button'>
                    <i class='icon bi-house-door-fill fa-3x'></i>
                </a>
            </div>
            <div class='pe-2'>
                <a href='../user/myPage'  class='btn w-auto' type='button'>
                    <i class='icon bi-person-fill fa-3x'></i>
                </a>
            </div>
        </div>
    </div>
</div>