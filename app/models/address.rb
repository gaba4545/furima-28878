class Address < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


            # 郵便番号、都道府県、市区町村、番地、電話番号が必須であること
            validates :postal_code,:shipping_origin_area,:municipality,:building_number,:phone_number,presence: true
            # 郵便番号にはハイフンが必要であること
            validates :postal_code, format: {with:/\A\d{3}[-]\d{4}\z/}
            # 電話番号にはハイフンは不要で、11桁以内であること
            validates :phone_number, format: {with:/\A\d{11}\z/}
end
