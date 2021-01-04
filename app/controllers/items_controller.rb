class ItemsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :explaining, :category_id, :status_id, :delivary_fee_id, :area_id, :need_day_id, :price).merge(user_id: current_user.id)
  end
end
