class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :order do |t|
 
        t.references :user, null: false, foreign_key: true
        t.references :item, null: false, foreign_key: true
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

