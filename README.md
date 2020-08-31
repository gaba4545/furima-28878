# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| name           | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| street_address | string | null: false |

### Association

- has_many :room_users
- has_many :出品, through: room_users
- has_many :messages

## itemsテーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| image            | string | null: false |
| name             | string | null: false |
| price            | string | null: false |
| item_explanation |  string | null: false |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## shops_users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| user       | string | null: false |
| paseword   | string | null: false |
| email      | string | null: false |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## details テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| category   | string | null: false |
| status     | string | null: false |

### Association

- belongs_to :item

## shipping テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| charge | string | null: false |
| area   | string | null: false |
| day    | string | null: false |