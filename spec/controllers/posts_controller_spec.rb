require 'spec_helper'

describe PostsController do
  context "create" do
    let!(:post) { build :post }
    it "should have status ok if new post saves" do
      get :create
      post.save
      expect(response).to be 200
    end
  end
end