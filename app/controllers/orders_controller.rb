class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def new
    
  end

  def create
       @item = Item.find(params[:item_id])
       @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
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
    params.require(:order_address).permit(:post_code, :area_id, :municipality, :address, :building_name, :phone_number, :order).merge(item_id: @item.id,user_id: current_user.id)
  end                                                                                                
  # | area_id               | integer    | null: false                    |
  # | municipality          | string     | null: false                    |
  # | address               | string     | null: false                    |
  # | building_name         | string     |                                |
  # | phone_number   　　　  | string     | null: false                    |
  # | order                 | references | null: false, foreign_key: true |
  




  # 削除
  # def address_params
  #   params.permit(:postal_code, :prefecture, :city, :house_number, :building_name).merge(donation_id: @donation.id)
  # end
end



