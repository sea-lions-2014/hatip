require 'spec_helper'


describe "Homepage", js: true do
  # before :each do
  #   visit root_path
  # end

  context "artist cards" do
  let!(:post) { create :post }
    it "should display a list of cards" do
      visit root_path

      expect(page).to have_css("div.post-card")
    end
    it "should have clickable cards" do
       visit root_path

      # fails due to lack of ENV variables for coinbase.
      find("div.post-card").click
    end
    it "should have a sign in with facebook button" do
      visit root_path
      expect(page).to have_content("Sign in with Facebook")
    end

    it "should redirect to facebook login screen on click" do
      # visit root_path
      # expect { click_on "Sign in with Facebook" }.to redirect_to(user_omniauth_authorize_path)
      pending
    end


  end
  context "modal" do
    it "should have a modal pop up on click"
    it "should display the stage name of the artists"
    it "should display the description of the artists video"
  end
end