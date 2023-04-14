$(() => {
	$.ajax({
		url: '../user/adminNav',
		success: function(result) {
    		$('.container-fluid').append(result)
		}
	})
})