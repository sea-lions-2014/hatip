class PagesController < ApplicationController
  def index
    @artists = User.find(:all, :limit => 10)
  end
end
