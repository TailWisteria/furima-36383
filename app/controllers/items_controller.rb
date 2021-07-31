class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all
  end

  def new
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

  # def show
  #   @item = Item.find(params[:id])
  # end

  private
  def item_params
    params.require(:item).permit(:name, :detail, :category_id, :condition_id, :shipping_charge_id, :required_day_id, :region_id, :price, :image).merge(user_id: current_user.id)
  end
end
