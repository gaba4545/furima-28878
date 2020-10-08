class AddressesController < ApplicationController
  before_action :authenticate_user! ,only: [:index]

  def index
    @address = Address.new
    @item = Item.find(params[:item_id])
    redirect_to root_path unless current_user.id != @item.user_id
  end

  def create
    @address = Address.new(address_params)
    if @address.valid?
      @address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def address_params
    params.require(:address).permit(:price)
  end
end