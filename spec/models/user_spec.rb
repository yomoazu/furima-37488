require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    
    it 'nicknameが空では登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")

    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank", "Email can't be blank")
    end
    it 'emailが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'メールアドレスは、@を含む必要があること' do
          @user.email = 'testexample'
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")

    end

    it 'encrypted_passwordが空では登録できない' do
      @user.password =''
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'encrypted_passwordが6文字以上での入力が必須であること' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は半角英数を両方含む必要があります")
    end


    it 'encrypted_passwordとパスワード（確認）は、値の一致が必須であること。' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_name_furiganaが空では登録できない' do
      @user.first_name_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furigana can't be blank")
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_name_furiganaが空では登録できない' do  
      @user.last_name_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name furigana can't be blank")
    end
    it 'date_of_bathが空では登録できない' do
      @user.date_of_bath = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of bath can't be blank") 
    end  
  end
end 