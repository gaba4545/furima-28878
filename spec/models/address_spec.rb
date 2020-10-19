require 'rails_helper'
describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end
  
  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "すべて正しく入力されていたら商品出品できる" do
        expect(@user).to be_valid
      end
    end
    context '商品出品がうまくいかない時' do
      it"postal_codeが空だと購入できない"do
        @user.postal_code = ''
        @user.valid?
        expect(@user.error.full_message).to include("postal_code can't be blank")
      end
      it"shipping_origin_area_idが空だと購入できない"do
        @user.shipping_origin_area_id = ''
        @user.valid?
        expect(@user.error.full_message).to include("shipping_origin_area_id can't be blank")
      end
      it"municipalityが空だと購入できない"do
        @user.municipality = ''
        @user.valid?
        expect(@user.error.full_message).to include("municipality can't be blank")
      end
      it"house_numberが空だと購入できない"do
        @user.house_number = ''
        @user.valid?
        expect(@user.error.full_message).to include("house_number can't be blank")
      end
      it"phone_numberが空だと購入できない"do
        @user.phone_number = ''
        @user.valid?
        expect(@user.error.full_message).to include("phone_number can't be blank")
      end
      it"postal_codeにはハイフンがないと購入できない"do
        @user.postal_code = "1234567"
        @user.valid?
        expect(@user.error.full_message).to include("postal_code can't be blank")
      end 
      it"phone_numberは、11桁以内であること"do
        @user.phone_number = "090123456789"
        @user.valid?
        expect(@user.error.full_message).to include("phone_number is too long (maximum is 11 characters")
      end
      it"phone_numberはハイフンは不要であること"do
        @user.phone_number = "090-1234-5678"
        @user.valid?
        expect(@user.error.full_message).to include("phone_number is not invalid")
      end
      it "priceとtokenがあれば保存ができること" do
        expect(@user).to be_valid
      end
      it "tokenが空では登録できないこと" do
        @address.token = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
