require 'rails_helper'
describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end
  
  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "すべて正しく入力されていたら商品出品できる" do
        expect(@address).to be_valid
      end
    end
    context '商品出品がうまくいかない時' do
      it"postal_codeが空だと購入できない"do
        @product_list.postal_code = ''
        @product_list.valid?
        expect(@product_list.error.full_message).to include("postal_code can't be blank")
      end
      it"shipping_origin_areaが空だと購入できない"do
        @product_list.shipping_origin_area = ''
        @product_list.valid?
        expect(@product_list.error.full_message).to include("shipping_origin_area can't be blank")
      end
      it"municipalityが空だと購入できない"do
        @product_list.municipality = ''
        @product_list.valid?
        expect(@product_list.error.full_message).to include("municipality can't be blank")
      end
      it"building_numberが空だと購入できない"do
        @product_list.building_number = ''
        @product_list.valid?
        expect(@product_list.error.full_message).to include("building_number can't be blank")
      end
      it"phone_numberが空だと購入できない"do
        @product_list.phone_number = ''
        @product_list.valid?
        expect(@product_list.error.full_message).to include("phone_number can't be blank")
      end
      it"postal_codeにはハイフンがないと購入できない"do
        @product_list.postal_code = "1234567"
        @product_list.valid?
        expect(@product_list.error.full_message).to include("postal_code can't be blank")
      end 
      it"phone_numberは、11桁以内であること"do
        @product_list.phone_number = "090123456789"
        @product_list.valid?
        expect(@product_list.error.full_message).to include("phone_number is too long (maximum is 11 characters")
      end
      it"phone_numberはハイフンは不要であること"do
        @product_list.phone_number = "090-1234-5678"
        @product_list.valid?
        expect(@product_list.error.full_message).to include("phone_number is not invalid")
      end
    end
  end
end
