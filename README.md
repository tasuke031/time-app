# テーブル設計

## users テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| name     | string  | null: false |
| email    | string  | null: false |
| password | string  | null: false |

### Association

- has_many :messages, dependent: :destroy

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :messages, dependent: :destroy

## messages テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| user_id  | integer | null: false |
| room_id  | integer | null: false |
| content  | text    | null: false |

### Association

- belongs_to :user
- belongs_to :room
