$(() => {
	$.ajax({
       	url: '../user/modal',
       	success: function(result) {         
			$('footer').before(result)
       	}
    })
})

function showConfirmModal(confirmMsg,url) {
   	$('#modalMsg').text(confirmMsg)
   	$('#modalBtn').show()
   	$('#modalOk').hide()
   	if(url) {
   		$('#okBtn').click(() => location.href=url)
	}
   	$('#modal').modal('show')
   	$('#okBtn').click(() => {
		$('#modal').modal('hide')
	})
}

function showOkModal(okMsg, url) {
   	$('#modalMsg').text(okMsg)
   	$('#modalBtn').hide()
   	$('#modalOk').show()
   	if(url) {
      	$('#modalOk').find('.btn-darkBlue').attr('href', url)
      	$('#modalOk').find('.btn-darkBlue').attr('data-bs-dismiss', '')
   	}
   	$('#modal').modal('show')
}
