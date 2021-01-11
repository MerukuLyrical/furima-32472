class BuyingLogsController < ApplicationController
  before_action :authenticate_user!
  before_action :return_to_index

  def index
    @buying = Buying.new
  end

  # アイテムの値段を取り出す記述を行う

  def create
    @buying = Buying.new(buying_params)
    if @buying.valid?
      pay_item
      @buying.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buying_params
    params.require(:buying).permit(:postal_code, :area_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: buying_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def return_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.buying_log.present? || current_user.id == @item.user.id
  end
end
