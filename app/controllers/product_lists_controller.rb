class ProductListsController < ApplicationController

  def index
    @product_lists = Product_lists.order(product_list_params)
  end

  def create
    @product_list = item.all()
     if @product_list.valid?
      @product_list.save
      redirect_to root_path
     else
      render :new
     end
  end

  def product_list_params
    params.require(:product_list).permit( :name, :price, :explanation, :category_id, :status_id, :shipping_charges_id, :shipping_origin_area_id, :days_until_shipping_id, :image).merge(user_id: current_user.id)
  end

end
