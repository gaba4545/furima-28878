FactoryBot.define do
  factory :item do
    name                    {"テスト"}
    price                   {4000}
    explanation             {"アイウエオ"}
    category_id             {1}
    status_id               {1}
    shipping_charges_id     {1}
    shipping_origin_area_id {1}
    days_until_shipping     {1}
    association :user
  end
end
