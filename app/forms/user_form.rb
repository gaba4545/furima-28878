class UserForm

  include ActiveModel::Model
  attr_accessor :email, :encrypted_password, :nickname, :surname_zenkaku, :name_zenkaku, :surname_katakana, :name_katakana, :birthday, :postal_code, :municipality, :building_number , :address , :prefecture, :purchase_history_id, :item_id, :user_id

end