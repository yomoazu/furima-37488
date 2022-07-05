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
    it 'product_nameが空では登録できない' do
      @item. product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end
   
    it ' description_of_itemが空では登録できない' do
      @item. description_of_item = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description of item can't be blank")
    end

    it 'category_idが空では登録できない' do
      @item.category_id =''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'product_condition_idが「---」だと登録できない' do
      @item.product_condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Product condition must be other than 1")
    end

    it '商品の状態の情報が空欄だと出品できない' do
      @item.product_condition_id =''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product condition can't be blank")
    end

    it 'delivery_charge_idが空では登録できない' do
      @item.delivery_charge_id =''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end

    it 'area_idが空では登録できない' do
      @item.area_id =''
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end

    it 'shipping_day_idが空では登録できない' do
      @item.shipping_day_id =''
      @item.valid?
      expect(@item.errors.full_messages).to include( "Shipping day can't be blank")
    end

    it '価格の範囲が、300円未満だと出品できない' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end

    it '価格の範囲が、9,999,999円を超えると出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it 'userの情報が空欄だと出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end

    it 'imageが空では登録できない' do
      @item.image =''
      @item.valid?
      expect(@item.errors.full_messages).to include("image can't be blank")
    end

    it 'priceが半角数字以外が含まれている場合は出品できない' do
      @user.password = '１２３４ｔｔtt'
      @user.valid?
      expect(@user.errors.full_messages).to include('Price は半角数字を両方含む必要があります')
    end
  end
  end
end
