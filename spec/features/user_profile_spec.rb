require 'spec_helper'

describe 'UserProfile' do
  context "Profile Creation" do
    it "should populate the profile with current users information" do

      user = create(:user)
      visit (user_path(user.id))
      expect(page).to have_content("raorao")
    end
  end
end

