require 'spec_helper'

describe 'Sign In Page' do
  before :each do
    visit new_user_session_path
  end
  it "should display a sign in form" do
    expect(page).to have_css('form.new_user')
  end

  it "should have a sign in button" do
    expect(page).to have_css('input.form-button')
  end

  it "should have a sign in with facebook button" do
    expect(page).to have_css('img.fbbutton')
  end

  it "should redirect to facebook when sign in with facebook is clicked" do
    # click_link('fb-image')
    # expect(current_path).to eq(user_omniauth_authorize_path)
    #to be implemented after merge brings that functionality
    pending
  end
end