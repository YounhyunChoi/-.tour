$(() => {
	$.ajax({
       	url: '../admin/navigation',
       	success: function(result) {
    		$('.container-fluid').append(result)
       }
    })
})
