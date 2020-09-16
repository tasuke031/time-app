# テーブル設計

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :chats

## chats テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| room     | references | null: false, foreign_key: true |
| nickname | string     | null: false                    |
| message  | text       |                                |
| image    | string     |                                |

### Association

- belongs_to :room

# 上記実装後下記追加

## users テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| nickname | string  | null: false |
| email    | string  | null: false |
| password | string  | null: false |

### Association

- has_many :viprooms, through： :room_users
- has_many :user_rooms

## viprooms テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| message        | text    | null: false |
| image          | string  | null: false |

### Association

- has_many :users, through： :room_users
- has_many :user_rooms

## user_viprooms テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| viproom   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :viproom

# 上記実装後下記追加

## notice テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| notice   | string  | null: false |
| datetime | date    | null: false |