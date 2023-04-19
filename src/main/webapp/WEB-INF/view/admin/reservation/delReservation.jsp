<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
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
<title>예약조회</title>
<script>
let changeAttr = function(component, text, removeClass, addClass, attrName, attrValue){
	component.text(text)
	component.removeClass(removeClass)	
	component.addClass(addClass)
	component.attr(attrName, attrValue)
}

let addComma = function(component, value){
	component.text(Number(value).toLocaleString('en').split(".")[0])
}
$.ajax({
	url: 'adminGet',
	dataType: 'json',
	data: {
		userId: `${param.userId}`
	},
	success: reservationDtos => {
		const resvDtoArr = []
		let presentDate = new Date()
		
		if(reservationDtos.length){
			$.each(reservationDtos, (i, reservationDto) => {
				resvDtoArr.push(
				`
				 <tr>
                    <td>\${reservationDto.resvNum}</td>
                    <td>\${reservationDto.resvDate}</td>
                    <td>\${reservationDto.tourName}</td>
                    <td class='chargePrice'>\${reservationDto.chargePrice}</td>
                    <td>
                        <button type='button' id= \${reservationDto.resvNum} class='btn cancelBtn btn-lightRed' edate=\${reservationDto.tourEDate}
                       	whetherToCancel=\${reservationDto.whetherToCancel}></button>
                    </td>
                </tr>
				`
				)	
			})
			$('tbody').append(resvDtoArr.join(''))
			
			$('.chargePrice').each(function(){
				addComma($(this), $(this).text())
			})
			$('.cancelBtn').each(function(){
				if($(this).attr('whethertocancel') == 'Y'){
					changeAttr($(this), '취소됨', 'btn-lightRed', 'btn-lightGray','disabled', 'disabled')
				}else if(presentDate.getTime() > new Date($(this).attr('edate')).getTime()){
					changeAttr($(this), '취소불가', 'btn-lightRed', 'btn-lightGray','disabled', 'disabled')
				}else if($(this).attr('whethertocancel') == 'N'){
					$(this).text('취소')
					$(this).addClass('btn-lightRed')
					$(this).click(() => {
						showConfirmModal('예약 취소 하시겠습니까?')
						$('#okBtn').click(() => {
							$.ajax({
								url:'fix',
								method: 'put',
								data: {
									resvNum: $(this).attr('id'),
									tourName: '"'+$(this).parent().prev().prev().text() + '"' + '이 취소되었습니다.',
									userId: `${param.userId}`
								},
								success: () => {
									changeAttr($(this), '취소됨', 'btn-lightRed', 'btn-lightGray','disabled', 'disabled')
								}
							})
						})
					})
				}
			})
		}else{
			$('tbody').html("<td class='fs-1' colspan='5'>예약내역이 없습니다.</td>")
		}
	}
	
})
</script>
<style>
.btn-lightGray {
	color: #fff !important;
    background-color: lightslategray !important;
    border-color: lightslategray !important;
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
							<a  class='border border-dark text-white p-2 mt-1' href='../user/adminMain' id='logo'>
								로고이미지
							</a>
						</div>
					</c:if>
                    <h1 class='text-center pt-3 text-white'><b>예약조회</b></h1>
                </div>
            </div>
        </div>
    </div>
    <div class='row'>
        <div class='col'>
            <div class='navigation fixed-top pt-2' id='subHeader'>
                <h6 class='text-white p-2'>
                    <a href='../user/adminMain'>메인</a> > <a href='../user/adminList'>회원목록</a> > <a href='../reservation/adminList'>예약조회</a>
                </h6>
            </div>
        </div>
    </div>
</header>
<div class='row' id='mainBody'>
    <div class='row'>
        <table class='table mt-3 table-bordered border-lighGray text-center table-sm'>
            <thead class='table-lightGray'>
                <tr>
                    <th>예약번호</th>
                    <th>예약일</th>
                    <th>코스명</th>
                    <th>결제금액</th>
                    <th>예약취소</th>
                </tr>
            </thead>
            <tbody class='align-middle'>
            </tbody>
        </table>
    </div>
</div>
<footer>
</footer>
</body>
</html>