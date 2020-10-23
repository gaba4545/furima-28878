class AddressesController < ApplicationController
  before_action :authenticate_user!, only:[:index]
  before_action :setup_item, only:[:index, :create, :pay_item]
  
  def index
    @address = UserForm.new
    redirect_to root_path if @item.purchase_history != nil
  end

  def create
    @address = UserForm.new(address_params)
    if @address.valid?
      pay_item
      @address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def address_params
    params.require(:user_form).permit( :postal_code, :shipping_origin_area_id, :municipality, :building_number, :house_number, :phone_number, :purchase_history_id).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
          amount: @item.price,
          card: address_params[:token],
          currency: 'jpy'
        )
  end

  def setup_item
    @item = Item.find(params[:item_id])
  end
  
end