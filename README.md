# README

## users テーブル

| Column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| nick_name          | string     | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |
| first_name         | string     | null: false               |
| last_name          | string     | null: false               |
| first_name_kana    | string    | null: false              |
| last_name_kana     | string     | null: false               |
| birth_day          | date       | null: false               |

## Association
has_many: items
has_many :histories

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| price              | integer    | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| delivery_day_id    | integer    | null: false                    |
| user               | references | null: false,foreign_key: true  |

## Association
belongs_to :user
has_one :history

## purchases テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| post_code     | string     | null: false                   |
| area_id       | integer    | null: false                   |
| municipality  | string     | null: false                   |
| address       | string     | null: false                   |
| building      | string     |                               |
| phone_number  | string     | null: false                   |
| history       | references | null: false,foreign_key: true |

## Association
belongs_to :history

## histories テーブル
| Column  | Type       | Options            |
| ------- |----------- | -------------------|
| user    | references | foreign_key: true  |
| item    | references | foreign_key: true  |

## Association
belongs_to :user
belongs_to :item
has_one :purchase
