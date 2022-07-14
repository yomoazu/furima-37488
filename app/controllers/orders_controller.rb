class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :ensure_current_user
 

  def index
    @order_address = OrderAddress.new
    

    

  def create
       @item = Item.find(params[:item_id])
       @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
       pay_item
       @order_address.save
       redirect_to root_path
          else
          render :index
       end
    
  end

  private

  def order_address_params
    params.require(:order_address).permit(:post_code, :area_id, :municipality, :address, :building_name, :phone_number, :order).merge(item_id: @item.id,user_id: current_user.id,token: params[:token])
  end  

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_address_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def ensure_current_user   
 
  if current_user == @item.user_id || @item.order.present?
    redirect_to root_path
    
  end
  end
end



