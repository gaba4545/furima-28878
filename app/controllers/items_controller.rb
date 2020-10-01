class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only:[:show,:edit,:update]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
     if @item.valid?
      @item.save
      redirect_to root_path
     else
      render :new
     end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  private

  def item_params
    params.require(:item).permit( :name, :price, :explanation, :category_id, :status_id, :shipping_charges_id, :shipping_origin_area_id, :days_until_shipping_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end