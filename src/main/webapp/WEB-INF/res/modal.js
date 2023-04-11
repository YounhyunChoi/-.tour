$(() => {
	$.ajax({
       	url: '../user/modal',
       	success: function(result) {         
			$('footer').before(result)
       	}
    })
})

function showConfirmModal(confirmMsg, okMsg, url) {
   	$('#modalMsg').text(confirmMsg)
   	$('#modalBtn').show()
   	$('#modalOk').hide()
   	$('#okBtn').click(() => showOkModal(okMsg, url))
   	$('#modal').modal('show')
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
