require 'rails_helper'
describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、password、password_confirmationが存在すれば登録できる" do
        @user.valid?
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかない時' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "emailは＠を含む必要がある" do
        @user.email = "text.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordは確認用を含めて2回入力が必須である" do
        @user.password = "aa11"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "0000"
        @user.password_confirmation = "0000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "surname_zenkakuとname_zenkakuがそれぞれ必須である" do
        @user.surname_zenkaku = "イトウ"
        @user.name_zenkaku = "タダタカ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname zenkaku is invalid", "Name zenkaku is invalid")
      end
      it "surname_katakanaとname_katakanaがカタカナでなけれがいけない" do
        @user.surname_katakana = "いのう"
        @user.name_katakana = "ただたか"
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname katakana is invalid", "Name katakana is invalid")
      end
      it"surname_katakanaは空ではいけない"do
        @user.surname_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname katakana can't be blank", "Surname katakana is invalid")
      end
      it"name_katakanaは空ではいけない"do
        @user.name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name katakana can't be blank", "Name katakana is invalid")
      end
      it "passwordは半角英数字混合である" do
        @user.password = "aA1１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)", "Password is too short (minimum is 6 characters)")
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
      it "emailが重複しない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
    end
 end
end