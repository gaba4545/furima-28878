class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

          #名前、全角苗字と名前、カタカナ苗字と名前、email、パスワードと再確認、生年月日が存在する
          validates :nickname,:surname_zenkaku,:name_zenkaku,:surname_katakana,:name_katakana,:email, :password, :password_confirmation, :birthday, presence: true
          #パスワードが6文字以上
          validates :password, :password_confirmation,    length: {minimum:6}
          #パスワードをアルファベット、数字の混合のみ
          validates :password, presence: true, format: {with: /[0-9a-zA-Z]/}
          #surname_zenkakuとname_zenkakuがそれぞれ必須
          validates :surname_zenkaku,:name_zenkaku, format: {with:/\A[一-龥ぁ-ん]/}
          #surname_katakanaとname_katakanaでそれぞれ必須
          validates :surname_katakana,:name_katakana, format: {with:/[ァ-ンヴー]/}

  has_one :address, dependent: :destroy
  has_one :purchase_history
end