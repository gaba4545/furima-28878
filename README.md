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
| address          | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many :items
- has_many :purchase_items
- has_many :purchase_histories

## items テーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| image                | string  | null: false |
| name                 | string  | null: false |
| price                | string  | null: false |
| item_explanation     | text    | null: false |
| category             | integer | null: false |
| status               | integer | null: false |
| shipping charges     | integer | null: false |
| shipping origin area | integer | null: false |
| days until shipping  | integer | null: false |

### Association

- belongs_to :user
- has_one :purchase_history

## purchase_items テーブル

| Column           | Type   | Option      |
| ---------------- | ------ | ----------- |
| postal code      | string | null: false |
| municipality     | string | null: false |
| building number  | string | null: false |
| address          | string | null: false |
| phone number     | string | null: false |
| user_id          | string | null: false |
| purchase_history | integer | null: false , foreginkey:true |

### Association

- belongs_to :user

## purchase_histories テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| purchase_items_id | integer | null: false |
| users_id          | integer | null: false |

### Association

- belongs_to :user
- has_one :purchase_item