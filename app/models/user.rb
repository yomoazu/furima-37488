class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true

  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります'}

  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角ひらがな・カタカナ・漢字でご入力下さい'}
  validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角ひらがな・カタカナ・漢字でご入力下さい'}
  validates :first_name_furigana, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナでご入力下さい"}
  validates :last_name_furigana, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナでご入力下さい"}
  
  validates :first_name, presence: true
  validates :first_name_furigana, presence: true
  validates :last_name, presence: true
  validates :last_name_furigana, presence: true
  validates :date_of_bath, presence: true

  has_many :items
  has_many :orders
end
