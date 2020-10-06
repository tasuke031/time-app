## アプリケーション名
* TIME-APP
___

## アプリケーション概要
最大24時間限定のルームを作成してトークができるリアルタイムチャットアプリです。
名前とEmail,パスワードの登録だけで誰でも利用できます。
指定時間後にはルームへのアクセスができなくなり、ルーム内のメッセージも閲覧できなくなります。
___

## URL
https://furima-29319.herokuapp.com/
___

## テスト用機能
ヘッダーにあるゲストログインボタンをクリックすると簡単にログインできます。
ルーム作成時に時間を0にすると1分限定のルームが作成できます。
___

## 利用方法
トップページから新規登録ページへアクセスしアカウントを作成してください。
その後トップページにあるルーム作成フォームからルームを作成するか既に作成されているルームへアクセスしてください。
ルーム内にある入力フォームにメッセージを入力し投稿ボタンを押すとリアルタイムでメッセージのやり取りができます。
Imageボタンをクリックすると投稿する画像を選択できます。
___

## 目指した課題解決
* コロナの影響で外出を控えている人たちの気晴らしをしたい人へ
* ビデオ通話でオンライン飲みが苦手な人、面倒になった人へ
* 過去の情報がずっと残ってしまうことが嫌な人へ
* 知人以外と気軽にチャットをしたい人へ
___

## 洗い出した要件
1. ユーザー管理機能 : ユーザの新規登録、ログイン/ログアウト、アカウントの編集/削除が行える。
2. ルーム作成機能 : 登録したユーザーは自由にルームを作成することができる。
3. メッセージ投稿機能 : 登録したユーザーは作成されたルーム内で自由にメッセージのやり取りができる。
4. 非同期通信機能 : ルーム内でのメッセージの送受信はページのリロードなしで行える。
5. ルームの時間制限機能 : 作成したルームは決められた時間になるとルーム内に投稿されたメッセージごと削除される。
6. 画像投稿機能 : メッセージと一緒に画像も投稿できる。
7. ルームの制限時間の選択 : ルーム作成時にルームが削除されるまでの時間をユーザーが指定できる。
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

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| name        | string  | null: false |
| chosen_time | integer | null: false |
#### Association

- has_many :messages, dependent: :destroy

### messages テーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| user_id | integer | null: false |
| room_id | integer | null: false |
| content | text    | null: false |
| avatar  | string  |             |

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
1. `git clone https://github.com/tasuke031/time-app.git`
2. rails db:create
3. rails db:migrate
4. rails s