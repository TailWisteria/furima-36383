# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| cc_last_name       | string | null: false |
| cc_first_name      | string | null: false |
| kk_last_name       | string | null: false |
| kk_first_name      | string | null: false |
| birth_day          | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル
| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| image           |            |                                |
| name            | string     | null: false                    |
| detail          | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| shipping_charge | string     | null: false                    |
| required_days   | string     | null: false                    |
| region          | string     | null: false                    |
| price           | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order

## orders テーブル
| Column    | Type       | Option                         | 
| --------- | ---------- | ------------------------------ |
| buyer     | references | null: false, foreign_key: true |
| seller    | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## shipping テーブル
| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| order            | references | null: false, foreign_key: true |
| postal_code      | string     | null: false, foreign_key: true |
| prefecture       | string     | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     | null: false                    |
| telephone_number | string     | null: false                    |

### Association

- belongs_to :order
