require 'spec_helper'

describe 'UserProfile', :js => true  do
  before :each do
    visit (user_path(user))
  end
  context "Profile Creation" do
    let!(:user) { create :user }
    it "should populate the profile with data from the user table" do
      expect(page).to have_content user.stage_name
    end

    it "should have a youtube video embedded" do
      expect(page).to have_css('div.yt-embed-thumbnail')
    end

    it "should show a button for users to tip" do
      sleep(10)
      page.should have_css('button')
    end

    it "should not display an edit button if the profile does not belong to the user" do
      page.should_not have_selector 'button', text: "Edit Profile"
    end
  end
end

