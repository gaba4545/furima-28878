class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charges
  belongs_to_active_hash :shipping_origin_area
  belongs_to_active_hash :days_until_shipping

  belongs_to :user
  has_one :purchase_history
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :price,                          numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/}
    validates :explanation
    validates :category_id,                    numericality: { other_than: 0 }
    validates :status_id,                      numericality: { other_than: 0 }
    validates :shipping_charges_id,            numericality: { other_than: 0 }
    validates :shipping_origin_area_id,        numericality: { other_than: 0 }
    validates :days_until_shipping_id,         numericality: { other_than: 0 }
    validates :image
  end

end