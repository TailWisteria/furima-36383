class ItemsController < ApplicationController


  def index
  end

  def new
    authenticate_user!
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :detail, :category_id, :condition_id, :shipping_charge_id, :required_day_id, :region_id, :price, :image).merge(user_id: current_user.id)
  end
end
