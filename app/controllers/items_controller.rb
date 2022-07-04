class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    # @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

 
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
      redirect_to controller: :products, action: :index
    else
      render :new
    end
    end

  private
  def item_params
    params.require(:item).permit(:product_name,:description_of_item,:category_id,:product_condition_id,:delivery_charge_id,:area_id,:shipping_day_id,:price,:image).merge(user_id: current_user.id)
  end

end
