class AddressesController < ApplicationController

  def index
    @address = UserForm.new
    @item = Item.find(params[:item_id])
    redirect_to root_path unless current_user.id != @item.user_id
  end

  def create

    @item = Item.find(params[:item_id])
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
# コントローラーの記述を見直す
  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
          amount: @item.price,
          card: address_params[:token],
          currency: 'jpy'
        )
  end

end