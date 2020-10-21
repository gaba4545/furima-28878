class UserForm

  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_origin_area_id, :municipality, :building_number , :house_number, :phone_number , :prefecture, :purchase_history_id, :item_id, :user_id, :address_id, :token
   # attr_accessorのキーとsaveメソッドのキーが一致しているか？
   #  saveメソッドで使っていないものは削除
  with_options presence: true do
    # 郵便番号、都道府県、市区町村、番地、電話番号が必須であること
    validates :postal_code,:shipping_origin_area_id,:municipality,:phone_number,presence: true
    # 郵便番号にはハイフンが必要であること
    validates :postal_code, format: {with:/\A\d{3}[-]\d{4}\z/}
    # 電話番号にはハイフンは不要で、11桁以内であること
    validates :phone_number, format: {with:/\A\d{11}\z/}
    # tokenが空では保存できない
    validates :token
  end

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id) 
    Address.create(postal_code: postal_code, shipping_origin_area_id: shipping_origin_area_id, municipality: municipality, building_number: building_number, house_number: house_number, phone_number: phone_number, purchase_history_id: purchase_history.id)
  end
end