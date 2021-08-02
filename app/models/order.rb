class Order < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :item
  belongs_to :region
  has_one :shipping
end
