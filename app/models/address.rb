class Address < ApplicationRecord
  belongs_to :order

  # validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  # validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
end




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
