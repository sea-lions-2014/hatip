$(function(){
	$('.profile-post-card').on('click', function(e) {
	  e.preventDefault();
	  	$(".yt-iframe").attr("src", $(this).data("embed"));
		$("html, body").animate({ scrollTop: "270px" });
	});
});