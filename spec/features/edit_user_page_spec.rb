require 'spec_helper'

describe 'Edit Profile' do
  before :each do
    visit edit_user_path(user)
  end
  let(:user) { create :user }
  it "should display a form with the user's current profile content in each field" do
    expect(page).to have_field('user[stage_name]', with: 'The Big Show')
  end
  it "should redirect the user to their updated profile after clicking update" do
    click_on("Update Profile Information")
    expect(current_path).to eq user_path(user)
  end
end