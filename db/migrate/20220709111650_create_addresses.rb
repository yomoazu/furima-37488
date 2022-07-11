class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
  
          t.string    :post_code,null: false
          t.integer    :area_id,null: false
          t.string    :municipality,null: false
          t.string    :address,null: false
          t.string    :building_name,null: false
          t.string    :phone_number, null: false
          t.references :order, null: false, foreign_key: true

          t.timestamps
    end
  end
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
# | phone_number          | string     | null: false                    |
# | order                 | references | null: false, foreign_key: true |
