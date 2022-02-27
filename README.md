# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :items
- has_one :purchase
- has_many :addresses
- has_many :comments

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| price         | integer    | null: false                    |
| introduction  | string     | null: false                    |
| category      | string     | null: false                    |
| item_status   | string     | null: false                    |
| shipping_cost | string     | null: false                    |
| shipping_area | string     | null: false                    |
| delivery_time | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- has_many :comments
- has_one :purchase

## purchases テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item           | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |
| card_number    | integer    | null: false                    |
| effective_date | integer    | null: false                    |
| security_code  | integer    | null: false                    |

### Association

- belongs_to :item
- belongs_to :user
_ has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| number        | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
- belongs_to :user

## comments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| comments | string     | null: false                    |
| item     | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user