class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(order_shipping_params)
    if @order_shipping.valid?
      @order_shipping.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_shipping_params
    params.require(:order_shipping).permit(:postal_code, :region_id, :municipalities, :address, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
