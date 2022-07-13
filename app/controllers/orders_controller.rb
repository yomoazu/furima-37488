class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
    @order = Order.new

    if current_user == @item.user || @item.order.present?

      redirect_to root_path
      else
        render :index
    end
  end


   



  def new
    
  end

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

  #def create
   # @item = Item.new(item_params)
    #if @item.save
     # redirect_to items_path
      #redirect_to root_path
      # else
      #render :new
      #render :new
   # end
 # end

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
end



