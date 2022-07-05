class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :area
  belongs_to :category
  belongs_to :delivery_charge
  belongs_to :product_condition
  belongs_to :shipping_day
  #has_one :order
  has_one_attached :image

  validates :area_id,:category_id,:delivery_charge_id,:product_condition_id,:shipping_day_id,presence: true 
  validates :area_id, numericality: { other_than: 1 } 
  validates :category_id, numericality: { other_than: 1 } 
  validates :delivery_charge_id, numericality: { other_than: 1 } 
  validates :product_condition_id, numericality: { other_than: 1 } 
  validates :shipping_day_id, numericality: { other_than: 1 } 

  validates :image, presence: true
  validates :product_name, presence: true
  validates :description_of_item, presence: true
  validates :price, presence: true
  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :price, numericality: true



end

