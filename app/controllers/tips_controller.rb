class TipsController < ApplicationController
  def create
    tip_info = {
      amount: params[:order][:total_btc][:cents]
    }
    Tip.create(tip_info)
  end
end