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



  end
  context "modal" do
    it "should have a modal pop up on click"
    it "should display the stage name of the artists"
    it "should display the description of the artists video"
  end
end