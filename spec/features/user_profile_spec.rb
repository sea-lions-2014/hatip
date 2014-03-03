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
      expect(page).to have_css('.yt-embed-thumbnail')
      sleep(3)
    end

    it "should show a button for users to tip" do
      # page.should have_css('button')
      pending
    end

    it "should not display an edit button if the profile does not belong to the user" do
      page.should_not have_selector 'button', text: "Edit Profile"
    end

    it "should display a Create New Post form when the New Post Button is clicked" do
      click_link("Create Post")
      page.should have_css('div.modal-content')
    end

    it "should display a user's profile image" do
      # page.should have_css("img[src='#{user.profile_image_url}']")
      #requires additional conversation about saving/uploading non fbook images
      pending
    end

  end
end

