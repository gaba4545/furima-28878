class ItemsController < ApplicationController

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

  #   @item.save
  #   redirect_to root_path
  # end


  private

  def item_params
    params.require(:item).permit(:name, :price, :explanation, :category_id, :status_id, :shipping_charges_id, :shipping_origin_area_id, :days_until_shipping_id, :image).merge(user_id: current_user.id)
  end

end