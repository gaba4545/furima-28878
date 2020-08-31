# テーブル設計

## users テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| nickname      | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
| name_zennkaku | string | null: false |
| name_katakana | string | null: false |
| address       | string | null: false |
| birthday      | string | null: false |

### Association

- has_many :items
- has_many :purchase_items
- has_many :purchase_histories

## items テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| image            | string | null: false |
| name             | string | null: false |
| price            | string | null: false |
| item_explanation | string | null: false |
| category         | string | null: false |
| status           | string | null: false |
| 発送料            | string | null: false |
| 発送元の地域       | string | null: false |
| 発送までの日数      | string | null: false |

### Association

- belongs_to :users
- has_one :purchase_histories

## purchase_items テーブル

| Column         | Type    | Option   |
| --------------- | ------ | ----------- |
| カード情報        | string | null: false |
| 有効期限          | string | null: false |
| セキュリティコード | string | null: false |
| 郵便番号          | string | null: false |
| 都道府県          | string | null: false |
| 市区町村          | string | null: false |
| 番地             | string | null: false |
| 電話番号          | string | null: false |
| user_id          | string | null: false |

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