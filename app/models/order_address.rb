class OrderAddress
  
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipality, :address, :building_name, :phone_number, :order, :user_id, :item_id, :token


  with_options presence: true do
    validates :municipality 
              
    validates :user_id
    validates :item_id
    validates :token
    validates :address
    validates :phone_number, format: {with:/\A\d{10,11}\z/, message:"半角数字の10ケタ以上11ケタ以下でご入力ください"}
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :area_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    
    order = Order.create(item_id: item_id, user_id: user_id)
   
    Address.create(post_code: post_code, area_id: area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end                                                                    
end