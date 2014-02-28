class PagesController < ApplicationController
  def index
    @artists = CardContainer.artists_to_feature
  end
end
