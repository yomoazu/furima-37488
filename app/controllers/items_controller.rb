class ItemsController < ApplicationController
  def index 
    params.require(:items).permit(:content, :image).merge(user_id: current_user.id)
  end
 
  end
 
end
