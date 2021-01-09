class BuyingLogsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buying = Buying.new
  end



  def create
    @item = Item.find(params[:item_id])
    @buying = Buying.new(buying_params)
    if @buying.valid?
      @buying.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def buying_params
    params.require(:buying).permit(:postal_code, :area_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
