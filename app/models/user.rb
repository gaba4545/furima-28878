class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
        # with_options presence: true do
        #   validates :nickname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
        #   validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "半角英字と半角数字それぞれ1文字以上含む8文字以上で入力してください"}
        #   validates :surname_zenkaku, format: { with: /\A[一-龥]+\z/, message: "は全角漢字で入力して下さい。"}
        #   validates :name_zenkaku, format: { with: /\A[一-龥]+\z/, message: "は全角漢字で入力して下さい。"}
        #   validates :surname_katakana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}
        #   validates :name_katakana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}
        #   validates :birthday
        # end

         
end
