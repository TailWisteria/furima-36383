class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, :index
  def index
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(order_shipping_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  def move_to_index
    if current_user.id = Item.find(params[:item_id]).user_id || Item.find(params[:item_id]).order.present?
      redirect_to root_path
    end
  end

  private

  def order_shipping_params
    params.require(:order_shipping).permit(:postal_code, :region_id, :municipalities, :address, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: order_shipping_params[:token],
      currency: 'jpy'
    )
  end

end
