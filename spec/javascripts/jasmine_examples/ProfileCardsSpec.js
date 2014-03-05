describe("ProfileCards", function(){

	it("should respond to click events", function() {
		
    var spyEvent = spyOnEvent('.profile-post-card', 'click' );

    $('.profile-post-card').click();
    expect( 'click' ).toHaveBeenTriggeredOn( '.profile-post-card' );
    expect( spyEvent ).toHaveBeenTriggered();

	});
});