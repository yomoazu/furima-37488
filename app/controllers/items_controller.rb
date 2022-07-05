class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    
    @items = Item.order("created_at DESC")
  end

  def new
    if user_signed_in?
    @item = Item.new
    else
      redirect_to user_session_path(@item_id)
   end
  end

 
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
      #redirect_to root_path
    else
      render :new
      #render :new
    end
  end

  def show
   def set_product
    @item = Item.find(params[:id])
    #@product = Product.find(params[:id])
   end

  end

  private
  def item_params
    params.require(:item).permit(:product_name,:description_of_item,:category_id,:product_condition_id,:delivery_charge_id,:area_id,:shipping_day_id,:price,:image).merge(user_id: current_user.id)
  end

end
