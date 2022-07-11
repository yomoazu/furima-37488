class OrderAddress
  
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipality, :address, :building_name, :phone_number, :order, :user_id, :item_id

  

# | Column                | Type       | Options                        |
# | ----------------------| ---------- | ------------------------------ |
# | user                  | references | null: false, foreign_key: true |
# | item                  | references | null: false, foreign_key: true |



# | Column                | Type       | Options                        |
# | ----------------------| ---------- | -------------------------------|
# | post_code             | string     | null: false                    |
# | area_id               | integer    | null: false                    |
# | municipality          | string     | null: false                    |
# | address               | string     | null: false                    |
# | building_name         | string     |                                |
# | phone_number   　　　  | string     | null: false                    |
# | order                 | references | null: false, foreign_key: true |




  with_options presence: true do
    validates :municipality
    validates :user_id
    validates :area_id
    validates :address
    validates :phone_number, format: {with: /\A[0-9]+\z/, message:"半角数字でご入力ください。"}
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :area_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    # 寄付情報を保存し、変数donationに代入する
    order = Order.create(price: price, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(post_code: post_code, area_id: area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, user_id: user_id, item_id: item_id, order_id: order.id)
  end
end