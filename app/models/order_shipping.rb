class OrderShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :region_id, :municipalities, :address, :building, :telephone_number, :token
  
  validates :user_id, :item_id, :postal_code, :region_id, :municipalities, :address, :telephone_number, :token, presence: true
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, region_id: region_id, municipalities: municipalities, address: address, telephone_number: telephone_number,order_id: order.id)
  end
end