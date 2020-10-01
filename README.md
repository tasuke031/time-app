## アプリケーション名
*TIME-APP
___

## アプリケーション概要
24時間限定のルームを作成してトークができるリアルタイムチャットアプリです。  24時間後にはルームはなくなります。  名前とEmail,パスワードの登録だけで誰でも利用できます。
___

## URL
https://furima-29319.herokuapp.com/
___

## テスト用アカウント
ヘッダーにあるゲストログインボタンをクリックすると簡単にログインできます。
___

## 利用方法
まずはトップページから新規登録ページへアクセスし新規登録しましょう。  その後トップページにあるルーム作成フォームからルームを作成するか既に作成されているルームへアクセスしましょう。  ルーム内にある入力フォームにメッセージを入力し投稿ボタンを押すとリアルタイムでメッセージのやり取りができます。
___

## 目指した課題解決
* コロナの影響で外出を控えている人たちの気晴らしをしたい人へ
* ビデオ通話での飲み会が苦手な人、面倒になった人へ
* 過去の情報がずっと残ってしまうことが嫌な人へ
* 知人以外と気軽にチャットをしたい人へ
___

## 洗い出した要件
1. ユーザー管理機能 : ユーザの新規登録、ログイン/ログアウト、アカウントの編集/削除が行える。
2. ルーム作成機能 : 登録したユーザーは自由にルームを作成することができる。
3. メッセージ投稿機能 : 登録したユーザーは作成されたルーム内で自由にメッセージのやり取りができる。
4. 非同期通信機能 : ルーム内でのメッセージの送受信はページのリロードなしで行える。
5. ルームの時間制限機能 : 作成したルームは決められた時間になるとルーム内に投稿されたメッセージごと削除される。
6. 画像投稿機能 : メッセージと一緒に画像も投稿できる。(追加実装予定)
7. ルームの制限時間の選択 : ルーム作成時にルームが削除されるまでの時間をユーザーが指定できる(追加実装予定)
___

## データベース設計
### テーブル設計

### users テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| name     | string  | null: false |
| email    | string  | null: false |
| password | string  | null: false |

#### Association

- has_many :messages, dependent: :destroy

### rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

#### Association

- has_many :messages, dependent: :destroy

### messages テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| user_id  | integer | null: false |
| room_id  | integer | null: false |
| content  | text    | null: false |

#### Association

- belongs_to :user
- belongs_to :room
___

### ローカルでの動作方法
##### 開発環
* macOS Catalina 10.15.6
* Ruby 2.6.5
* Rails 6.0.3
* Mysql2 0.4.4

#### 手順
1. [Time-app](git clone https://github.com/tasuke031/time-app.git)
2. rails db:create
3. rails s