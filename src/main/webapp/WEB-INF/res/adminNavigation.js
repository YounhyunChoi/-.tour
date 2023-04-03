$(() => {
	$.ajax({
       	url: '../admin/nav',
       	success: function(result) {
    		$('.container-fluid').append(result)
       }
    })
})
