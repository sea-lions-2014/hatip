class TipsController < ApplicationController
	def index
		render json: { message: "this is the tips controller" }
	end

  def create
    tip_info = {
      amount: params[:order][:total_btc][:cents]
    }
    Tip.create(tip_info)
    respond_to do
    	format.json { head: ok }
    end
  end
end