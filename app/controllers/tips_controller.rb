class TipsController < ApplicationController
  def create
    tip = Tip.build_from_callback(params)
    if tip.save
      render json: { success: "success" }
    else
      render json: { error: "error" }
  end
end


