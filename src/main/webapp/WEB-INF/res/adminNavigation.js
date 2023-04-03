$(() => {
	$.ajax({
       	url: '../../user/nav',
       	success: function(result) {
    		$('.container-fluid').append(result)
       }
    })
})
