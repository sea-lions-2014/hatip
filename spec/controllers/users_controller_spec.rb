require 'spec_helper'

describe UsersController do
  let!(:user) { create :user}
  it 'should load the profile page for a user' do
    get :show, id: user.id
    response.should be_success
  end
  context 'update' do
    let!(:user) { create :user }
    it "should update a user's profile with valid params" do
      put :update, id: user.id
      user.update_attributes(stage_name: "New Show")
      expect(user.stage_name).to eq "New Show"
    end
    it "should not update a user's profile with invalid params" do
      user.update_attributes(stage_name: "")
      expect(user.valid?).to eq false
    end
    it "should render the errors partial on attempt to save invalid params" do
      user.update_attributes(stage_name: "")
      response.should render_template(partial: "update_form_error")
    end
  end
  context 'destroy' do
    let!(:user) { create :user }
    it "should redirect users to the homepage after deleting their profile" do
      delete :destroy, id: user.id
      response.should redirect_to root_path
    end
  end
end