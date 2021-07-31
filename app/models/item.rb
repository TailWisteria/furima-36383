class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :region
  belongs_to :required_day
  belongs_to :user
  has_one_attached :image

  validates :category_id, :condition_id, :shipping_charge_id, :region_id, :required_day_id, numericality: { other_than: 1 ,message: "can't be blank"}
  validates :image, :user, :name, :detail, :category_id, :condition_id, :shipping_charge_id, :required_day_id, :region_id, :price, presence: true
  validates :price, format: { with: /\A[0-9]+\z/ }, numericality: {in: 300..9999999}
  validates :name, length: {maximum: 40}
  validates :detail, length: {maximum: 100}
end
