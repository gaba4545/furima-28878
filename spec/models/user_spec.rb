require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordが存在すれば登録できる" do
      end
      it "emailが一意性である" do
      end
      it "emailは＠を含む必要がある"
      end
      it "passwordは半角英数字混合である"
      end
      it "passwordは確認用を含めて2回入力が必須である"
      end
      it "新規登録・ログイン共にエラーハンドリングができている"
      end
      it "passwordが6文字以上であれば登録できる" do
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
      end
      it "emailは＠を含まれていない" do
      end
      it "emailが空では登録できない" do
      end
      it "重複したemailが存在する場合登録できない" do
      end
      it "passwordが空では登録できない" do
      end
      it "passwordが半角英数字混合でない" do
      end
      it "passwordが5文字以下は登録できない" do
      end
    end
  end
end