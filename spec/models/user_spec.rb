require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録ができる時' do
      it '全てのuser情報が正しく存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    
    context 'ユーザー登録ができない時' do
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

    it 'encrypted_passwordが半角英字のみでは保存できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end

    it 'encrypted_passwordが半角数字のみでは保存できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end

    it 'encrypted_passwordが全角英数混合では保存できない' do
      @user.password = '１２３４ｔｔ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
    end

    it 'encrypted_passwordが6文字以上での入力が必須であること' do
      @user.password = 'a0000'
      @user.password_confirmation = 'a0000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end


    it 'encrypted_passwordとパスワード（確認）は、値の一致が必須であること。' do
      @user.password = 'a123456'
      @user.password_confirmation = 'a1234567'
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

    it "名字のフリガナは全角（カタカナ）でなければ登録できない" do
      @user.first_name_furigana = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角カタカナでご入力下さい")
    end
    it "名前のフリガナは全角（カタカナ）でなければ登録できない" do
      @user.last_name_furigana = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角カタカナでご入力下さい")
    end
    it "名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.first_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角ひらがな・カタカナ・漢字でご入力下さい")
    end
    it "名前は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.last_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角ひらがな・カタカナ・漢字でご入力下さい")
    end

    it 'date_of_bathが空では登録できない' do
      @user.date_of_bath = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of bath can't be blank") 
    end  
   end
  end
end 