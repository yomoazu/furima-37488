require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '新規商品投稿' do
    context '新規商品投稿ができる時' do
      it '全てのitem情報が正しく存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    
    context '商品投稿ができない時' do
    it ' product_nameが空では登録できない' do
      @item. product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include(" Product_name can't be blank")

    end
    it ' description_of_itemが空では登録できない' do
      @item. description_of_item = ''
      @item.valid?
      expect(@item.errors.full_messages).to include(" Description_of_item can't be blank", "Email can't be blank")
    end
    
    end

    it 'category_idが空では登録できない' do
      @item.password =''
      @item.password_confirmation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category_id can't be blank")
    end

    it 'product_condition_idが空では登録できない' do
      @item.password =''
      @item.password_confirmation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product_condition_id can't be blank")
    end

    it 'delivery_charge_idが空では登録できない' do
      @item.password =''
      @item.password_confirmation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery_charge_id can't be blank")
    end

    it 'area_idが空では登録できない' do
      @item.password =''
      @item.password_confirmation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Area_id can't be blank")
    end

    it 'shipping_day_idが空では登録できない' do
      @item.password =''
      @item.password_confirmation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping_day_id can't be blank")
    end

    it "priceが9999999だと登録できる" do
      @item.password =''
      @item.password_confirmation = ''
      @item.valid?
      
      item = build(:item, price: "9999999",seller_id: user[:id],seller_id: user[:id], category_id: category[:id])
 
    end
 
    
    it "priceが10000000だと登録できないこと" do
      @item = create(:item)
      category = create(:category)
 
      item = build(:item, price: "10000000",seller_id: user[:id],seller_id: user[:id], category_id: category[:id])
 
      expect(item.errors[:price]).to include("値段は300円以上10000000円未満を設定してください")
    end
 
    














