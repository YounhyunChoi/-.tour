$(() => {
    $.ajax({
       	url: '../user/nav',
       	success: function(result) {
          	$('header').html(result)
          	let header = $('header').find('#header')
          	let footer = $('header').find('#footer')
          	$('header').html(header)
          	$('footer').html(footer)
       	}
    })
    
    $('.bi.bi-chevron-left').click(() => {
		history.go(-1)
	})
})