require 'spec_helper'

describe "Sign Up Page" do
  before :each do
    visit new_user_registration_path
  end
  it "should display a sign up form" do
    expect(page).to have_css('form.new_user')
  end

  it "should have a sign up button" do
    expect(page).to have_css('input.form-button')
  end

  it "should have a sign up with facebook button" do
    expect(page).to have_css('img.fbbutton')
  end

  it "should redirect to facebook login screen on click" do
    # click_link('fbbutton')
    # expect (current_path).to eq user_omniauth_authorize_path
    pending
  end
end