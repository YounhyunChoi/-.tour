function showConfirmModal(confirmModal, okModal, url) {
   $('#modalMsg').text(confirmModal)
   $('#modalBtn').show()
   $('#modalOk').hide()
   $('#okBtn').click(() => showOkModal(okModal, url))
   $('#modal').modal('show')
}
 
function showOkModal(okModal, url) {
   $('#modalMsg').text(okModal)
   $('#modalBtn').hide()
   $('#modalOk').show()
   if(url) {
      $('#modalOk').find('.btn-darkBlue').attr('href', url)
      $('#modalOk').find('.btn-darkBlue').attr('data-bs-dismiss', '')
   }
   $('#modal').modal('show')
}