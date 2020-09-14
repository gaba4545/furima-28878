require 'rails_helper'
describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、password、password_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "emailが一意性である" do
        duplicate_user = @user.dup
        @user.save
        assert_not duplicate_user.valid?
      end
      it "passwordは半角英数字混合である" do
        @user.password = "aA1１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwoed can't be blank")
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end
      it "birthdayが必須であること" do
        @user.birthday = "YYYY-MM-DD"
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end



    ]context '新規登録がうまくいかない時' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.error.full_message).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.error.full_message).to include("Email can't be blank")
      end
      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.error.full_message).to include("Password can't be blank")
      end
      it "emailは＠を含む必要がある" do
        @user.email = "text.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordは確認用を含めて2回入力が必須である" do
        @user.password = "aa11"
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwoed can't be blank")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
        expect(@user.errors.full_messages).to include("Passwoed is too short")
      end
      it "surname_zenkakuとname_zenkakuがそれぞれ必須である" do
        @user.surname_zenkaku = "イトウ"
        @user.name_zenkaku = "タダタカ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Not zenkaku")
      end
      it "surname_katakanaとname_katakanaがカタカナでなけれがいけない" do
        @user.surname_katakana = "いのう"
        @user.name_katakana = "ただたか"
        @user.valid?
        expect(@user.errors.full_messages).to include("Not katakana")
      end
      it"surname_katakanaは空ではいけない"do
        @user.surname_katakana = ''
        @user.valid?
        expect(@user.error.full_message).to include("Nickname can't be blank")
      end
      it"name_katakanaは空ではいけない"do
        @user.name_katakana = ''
        @user.valid?
        expect(@user.error.full_message).to include("Nickname can't be blank")
      end
    end
 end
end