$(function(){

$('.profile-post-card').on('click', function(e) {
    e.preventDefault()
    	$("iframe").attr("src", $(this).data("embed"));
	});



});