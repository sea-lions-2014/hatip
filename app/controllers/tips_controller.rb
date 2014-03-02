class TipsController < ApplicationController
	def index
		render json: { message: "this is the tips controller" }
	end

  def create
  	puts params
    tip_info = {
      amount: params[:order][:total_btc][:cents]
    }
    Tip.create(tip_info)
    render json: { success: "success" }
  end
end