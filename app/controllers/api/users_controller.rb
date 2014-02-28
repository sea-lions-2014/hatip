class Api::UsersController < ApplicationController
  def show
    render json: User.find(params[:id]).card_data
  end
end
