require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '寄付情報の保存' do
   before do
     order = FactoryBot.build(:order)
     @order_form = FactoryBot.build(:post_code,:area_id,:municipality,:address,:building_name,:phone_number)
   end
 end
  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
       expect(@order).to be_valid
     end
     it 'user_idが空でなければ保存できる' do
       @order_form.user_id = 1
        expect(@order).to be_valid
     end
     it 'item_idが空でなければ保存できる' do
       @order_form.item_id = 1
       expect(@order).to be_valid
     end
     it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
       @order_form.post_code = '123-4560'
       expect(@order).to be_valid
     end
     it '都道府県が「---」以外かつ空でなければ保存できる' do
      @order_form.area_id = 1
      expect(@order).to be_valid
    end
    end
    it '市区町村が空でなければ保存できる' do
      @order_form.municipality = '横浜市'
      expect(@order).to be_valid
    end
    it '番地が空でなければ保存できる' do
      @order_form.block = '旭区１２３'
      expect(@order).to be_valid
    end
    it '建物名が空でも保存できる' do
      @order_form.building_name = nil
      expect(@order).to be_valid
    end
    it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
      @order_form.phone_number = 12_345_678_910
      expect(@order).to be_valid
    end
  end

  context '配送先情報の保存ができないとき' do
    it 'user_idが空だと保存できない' do
      @order_form.block = nil
      @order_form.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空だと保存できない' do
      @order_form.item_id = nil
      @order_form.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end
    it '郵便番号が空だと保存できないこと' do
      @order_form.post_code = nil
      @order_form.valid?
      expect(@order.errors.full_messages).to include("Post_code can't be blank", 'Postcode is invalid. Include hyphen(-)')
    end
    it '郵便番号にハイフンがないと保存できないこと' do
      @order_form.post_code = 1_234_567
      @order_form.valid?
      expect(@order.errors.full_messages).to include('Post_code is invalid. Include hyphen(-)')
    end
    it '都道府県が「---」だと保存できないこと' do
      @order_form.area_id = 0
      @order_form.valid?
      expect(@order.errors.full_messages).to include("Area_id can't be blank")
    end
    it '都道府県が空だと保存できないこと' do
      @order_form.area_id = nil
      @order_form.valid?
      expect(@order.errors.full_messages).to include("Area_id can't be blank")
    end
    it '市区町村が空だと保存できないこと' do
      @order_form.municipality = nil
      @order_form.valid?
      expect(@order.errors.full_messages).to include("Municipality can't be blank")
    end
    it '番地が空だと保存できないこと' do
      @order_form.address = nil
      @order_form.valid?
      expect(@item_order.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空だと保存できないこと' do
      @order_form.phone_number = nil
      @order_form.valid?
      expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号にハイフンがあると保存できないこと' do
      @order_form.phone_number = '123 - 1234 - 1234'
      @order_form.valid?
      expect(@item_order.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号が12桁以上あると保存できないこと' do
      @order_form.phone_number = 12_345_678_910_123_111
      @order_form.valid?
      expect(@item_order.errors.full_messages).to include('Phone number is invalid')
    end
    it 'トークンが空だと保存できないこと' do
      @order_form.token = nil
      @order_form.valid?
      expect(@item_order.errors.full_messages).to include("Token can't be blank")
    end
  end
end