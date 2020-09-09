require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
    
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "emailが一意性である" do
        duplicate_user = @user.dup
        @user.save
        assert_not duplicate_user.valid?
      end
      it "emailは＠を含む必要がある" do
        @user.email = "text.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordは半角英数字混合である" do
        @user.password = "aA1１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwoed can't be blank")
      end
      it "passwordは確認用を含めて2回入力が必須である" do
        @user.password = "aa11"
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwoed can't be blank")
      end
      it "新規登録・ログイン共にエラーハンドリングができている" do
        @user.valid?
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end
      it "surname_zenkakuとname_zenkakuがそれぞれ必須である" do
        @user.surname_zenkaku = "イトウ"
        @user.name_zenkaku = "タダタカ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Not zenkaku")
      end
      it "surname_katakanaとname_katakanaでそれぞれ必須である" do
        @user.surname_katakana = "いのう"
        @user.name_katakana = "ただたか"
        @user.valid?
        expect(@user.errors.full_messages).to include("Not katakana")
      end
      it "birthdayが必須であること" do
        @user.birthday = "00/00"
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end

    # context '新規登録がうまくいかないとき' do
    #   it "nicknameが空だと登録できない" do
    #   end
    #   it "emailは＠を含まれていない" do
    #   end
    #   it "emailが空では登録できない" do
    #   end
    #   it "重複したemailが存在する場合登録できない" do
    #   end
    #   it "passwordが空では登録できない" do
    #   end
    #   it "passwordが半角英数字混合でない" do
    #   end
    #   it "passwordが5文字以下は登録できない" do
    #   end
    #   it "surname_zenkakuとname_zenkakuがそれぞれ正しく登録できていない" do
    #   end
    #   it "surname_katakanaとname_katakanaがそれぞれ正しく登録できていない" do
    #   end
    #   it "birthdayが登録できていない" do
    #   end
    # end
   end
 end