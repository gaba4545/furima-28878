require 'rails_helper'
describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "すべて正しく入力されていたら商品出品できる" do
        expect(@item).to be_valid
      end
    end


    ]context '商品出品がうまくいかない時' do
      it "imageが空だと出品できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.error.full_message).to include("Image can't be blank")
      end
      it "nameが空だと出品できない" do
        @user.email = ''
        @user.valid?
        expect(@user.error.full_message).to include("Name can't be blank")
      end
      it "explanationが空だと出品できない" do
        @user.password = ''
        @user.valid?
        expect(@user.error.full_message).to include("Explanation can't be blank")
      end
      it "priceが空だと出品できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.error.full_message).to include("Price can't be blank")
      end
      it "categoryが空だと出品できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.error.full_message).to include("Category can't be blank")
      end
      it "statusが空だと出品できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.error.full_message).to include("Status can't be blank")
      end
      it "shipping_chargesが空だと出品できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.error.full_message).to include("Shipping_charges can't be blank")
      end
      it "shipping_origin_areaが空だと出品できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.error.full_message).to include("Shipping_origin_area can't be blank")
      end
      it "days_until_shippingが空だと出品できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.error.full_message).to include("Days_until_shipping can't be blank")
      end
      it "nameが40文字以上では出品できない" do
        @user.name = "00000000000000000000000000000000000000000000"#43
        expect(@user).to be_valid
        expect(@user.error.full_message).to include("Name is too long")
      end
      it "priceは半角数字でないと出品できない" do
        @user.password = "1１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end
