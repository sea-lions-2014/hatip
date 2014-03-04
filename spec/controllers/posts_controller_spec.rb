require 'spec_helper'

describe PostsController do
  context "create" do
    it "creates a new post with valid attributes" do
      expect { post :create, post:
               FactoryGirl.attributes_for(:post)}.to change { Post.count }.by(1)
      expect(response).to be_redirect
    end
  end
end