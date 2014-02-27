require 'spec_helper'

describe 'UserProfile' do
  before :each do
    user = create(:user)
  end
  context "Profile Creation" do
    it "should populate the profile with current users information" do
      visit (user_profile_path(user))
      expect(page).to have_content(user.first_name)
    end
  end
end