# テーブル設計

## users テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| nickname      | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
| surname_zenkaku | string | null: false |
| name_zenkaku | string | null: false |
| surname_katakana | string | null: false |
| name_katakana | string | null: false |
| address       | string | null: false |
| birthday      | string | null: false |

### Association

- has_many :items
- has_many :purchase_items
- has_many :purchase_histories

## items テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| image                | string | null: false |
| name                 | string | null: false |
| price                | string | null: false |
| item_explanation     | string | null: false |
| category             | string | null: false |
| status               | string | null: false |
| shipping charges     | string | null: false |
| shipping origin area | string | null: false |
| days until shipping  | string | null: false |

### Association

- belongs_to :users
- has_one :purchase_histories

## purchase_items テーブル

| Column       | Type   | Option      |
| ------------ | ------ | ----------- |
| postal code  | string | null: false |
| prefecture   | string | null: false |
| municipality | string | null: false |
| address      | string | null: false |
| phone number | string | null: false |
| user_id      | string | null: false |

### Association

- belongs_to :users

## purchase_histories テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| purchase_items_id | string | null: false |
| users_id          | string | null: false |

### Association

- belongs_to :users
- has_one :purchase_items