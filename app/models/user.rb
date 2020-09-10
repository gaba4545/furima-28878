class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         with_options presence: true do
          validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
          validates :email, format: { with: [\w\-._]+@[\w\-._]+\.[A-Za-z]+, message: "は半角英数字で入力してください"}
          validates :password, format: { with: /^(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,}$/i, message: "半角英字と半角数字それぞれ1文字以上含む8文字以上で入力してください"}
          validates :name_zemmkaku, format: { with: /\A[一-龥]+\z/, message: "は全角漢字で入力して下さい。"}
          validates :name_katakana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}
          validates :birthday, format: { ^[0-9]{4}/(0[1-9]|1[0-2])/(0[1-9]|[12][0-9]|3[01])$, message: "は半角数字で入力してください。"}
        end
      
         validates :name, presence: true
         
end
