$(function(){
	profileController.clickEvents()
})

var profileController = {
	clickEvents: function(){
		$('.profile-post-card').on('click', profileController.playerScroll)
		$('#show-posts').on('click', profileController.scrollToVideo)
	},

	playerScroll: function(e) {
		e.preventDefault
		$(".yt-iframe").attr("src", $(this).data("embed"));
		$("html, body").animate({ scrollTop: "270px" });
	},

	scrollToVideo: function(e) {
		e.preventDefault();
		$('html, body').animate({ scrollTop: "810px"})
	}
}