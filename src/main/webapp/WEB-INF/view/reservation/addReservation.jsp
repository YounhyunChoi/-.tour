<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link
	href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css'
	rel='stylesheet' />
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css' />
<link href='https://getbootstrap.com/docs/5.3/assets/css/docs.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<link href='../res/style.css' rel='stylesheet' />
<script src='../res/navigation.js'></script>
<script src='../res/modal.js?ver=2'></script>
<title></title>
<script>
$(() => {
	$.ajax({
		url: 'getTour',
		data: {
			tourNum: ${param.tourNum}
		},
		dataType: 'json',
		success: tour => {
				console.log(tour)
				$('#tourName').text(tour[0].tourName)
				$('#tourContent').text(tour[0].tourContent)
				$('#tourPrice').text(tour[0].tourPrice)
				let chargePrice = $('#tourPrice').text() - $('#salePrice').text()
				$('.chargePrice').text(chargePrice)
				
				$.ajax({
					url: '../term/get',
					data: {
						termNum: tour[0].termNum
					},
					dataType: 'json',
					success: term => {
						$('#termContent').text(term.termContent)
					}
				})
				
				 $('#paymentBtn').click(() => {    
	           		let charge = {
	                      	chargePrice: $('#tourPrice').text() - $('#salePrice').text()
	                       }
	           		
	           		$.ajax({
	                  	url: '../charge/add',
	                  	method: 'post',
	                  	data: charge
	                  }).then((arg) => {
	                	  $.ajax({
	    	           			url: '../charge/getCharge',
	    	           			dataType: 'json',
	    	           			success: charges => {
	    	           				console.log(charges[charges.length - 1])
	    	           				$.ajax({
	    	           					url: 'add',
	    	           					method: 'post',
	    	           					data: {
	    	           						tourNum: tour[0].tourNum,
	    	           						chargeNum: charges[charges.length - 1].chargeNum
	    	           					}
	    	           				})
	    	           			}
	    	           		})
	                  })                                            
        })	
		}
		}
	)
	
   $('#paymentBtn').attr('disabled', 'disabled')
   $('#agreeCheckbox').change(() => {
      if ($('#agreeCheckbox').prop('checked')) $('#paymentBtn').removeAttr('disabled')
      else if (!$('#agreeCheckbox').prop('checked')) $('#paymentBtn').attr('disabled', 'disabled')
   })
   $('#paymentBtn').click(() => {
      showOkModal('여행코스가 예약되었습니다.', '02.html')
   })
   
   
})
</script>
<style>
</style>
</head>

<body>
	<header> </header>
	<div class='navigation fixed-top'>
		<div class='float-start mt-2 ms-2'>
			<i class='bi bi-caret-left-fill'></i>
		</div>
		<div class='menuName'>
			<h2 class='text-center pt-3'>
				<b>예약하기</b>
			</h2>
		</div>
	</div>
	<div class='container px-4 mt-4'>
		<div class='row d-block'>
			<div class='col p-2'>
				<b>상품 확인</b>
			</div>
			<div class='col p-2 border border-2 contents shadow-sm'>
				<b>상품명</b><br> <span id='tourName'></span><br> <b>상품내용</b><br>
				<span id='tourContent'></span>
			</div>
		</div>
		<div class='row d-block'>
			<div class='col p-2'>
				<b>금액 및 할인</b>
			</div>
			<div class='col p-2 border border-2 contents shadow-sm'>
				<b>총 예약 금액</b><span id='tourPrice'></span><br>
				<b>할인 금액</b><span id='salePrice'>1</span>원<br><br>
				<b>결재 금액</b><span class='chargePrice'></span>
			</div>
		</div>
		<div class='row d-block'>
			<div class='col p-2'>
				<b>필수안내 약관</b>
			</div>
			<div class='col p-2 border border-2 contents shadow-sm'>
				<span id='termContent'></span><br>
			</div>
			<div class='col p-2 text-left'>
				<input type='checkbox' id='agreeCheckbox'
					class='form-check d-inline align-middle'> <label
					for='agreeCheckbox' class='form-check-label align-middle'>
					상기 필수안내 약관에 동의합니다. </label>
			</div>
		</div>
		<div class='row'>
			<div class='col mt-5 d-flex justify-content-center'>
				<button id='paymentBtn' type='button' data-bs-toggle="modal"
					data-bs-target="#modal"
					class='px-5 py-2 border-0 rounded btn-lightRed text-center text-white '>
					<span class='chargePrice'></span>원결제하기
				</button>
			</div>
		</div>
	</div>

	<footer> </footer>
</body>

</html>