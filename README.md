# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| surname_zenkaku  | string | null: false |
| name_zenkaku     | string | null: false |
| surname_katakana | string | null: false |
| name_katakana    | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many :items
- has_many :purchase_histories

## items テーブル

| Column                  | Type    | Options     |
| ----------------------- | ------- | ----------- |
| name                    | string  | null: false |
| price                   | integer | null: false |
| explanation             | text    | null: false |
| category_id             | integer | null: false |
| status_id               | integer | null: false |
| shipping_charges_id     | integer | null: false |
| shipping_origin_area_id | integer | null: false |
| days_until_shipping     | integer | null: false |
| user_id                 | integer | null: false , foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase_history

## addresses テーブル

| Column              | Type    | Option      |
| ------------------- | ------- | ----------- |
| postal_code         | string  | null: false |
| municipality        | integer | null: false |
| building_number     | string  |
| address             | string  | null: false |
| phone_number        | string  | null: false |
| purchase_history_id | integer | null: false , foreign_key: true |

### Association

- has_one :purchase_history

## purchase_histories テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| item_id       | integer | null: false , foreign_key: true |
| user_id       | integer | null: false , foreign_key: true |

### Association

- belongs_to :user
- has_one :addresses
- belong_to :item