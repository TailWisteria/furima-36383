class Order < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :item
  belongs_to :region
  belongs_to :item
  has_one :shipping, dependent: :destroy
end
