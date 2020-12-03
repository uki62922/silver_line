# アプリケーション名
 シルバーライン
# アプリケーション概要
高齢者向けに使いやすいチャットアプリです
# URL
http://54.150.39.113/
# ベーシック認証
#### USER    admin
#### パスワード 2222
# テスト用アカウント(1)
#### メールアドレス test1@test
#### パスワード 123aaa
#### 電話番号 0123456789
# テスト用アカウント(2)
#### メールアドレス test2@test
#### パスワード 123aaa
#### 電話番号 01234567890
# 利用方法
1. 未ログイン時はログインページに遷移されます。

2. テスト用アカウント(1)でログイン、または新規登録します。
- 電話番号は適当な数字10〜11桁を入力してください。
- メールアドレスには@を含めてください。
- どちらもすでに登録されているものは使用できません。
3. 右上の電話帳に追加ボタンから、電話番号検索でチャット相手を追加します。テスト用アカウントの電話番号で追加できます。
4. 下部の電話帳を開くボタンから、チャット相手を選択し、フォームからメッセージを送信できます。
# 目指した課題解決  
1. 高齢者もチャットがしたいが、使わない機能が多く難しく感じてしまう。
2. 高齢者にもわかりやすい必要最低限の機能のみ実装する
3. 大きめのフォントサイズや、できるだけ英語を使わないなど、高齢者向けのUIにする
# 洗い出した要件定義
# 実装した機能についてのGIFと説明
- 友達機能
- ユーザー検索機能
https://gyazo.com/7ffc41977e636290630c126acc41f7d8
- ユーザーアイコン機能
https://gyazo.com/ed8a54482caa9a97865624f15970c18a
- 左右分岐のチャット機能
https://gyazo.com/7f833ad1cdfbd24c819fc770a635ac1e

# 実装予定の機能
#### スマホアプリ化
#### チャット機能の非同期通信
#### 既読機能
#### 音声通話、ビデオ通話機能
# ローカルでの動作方法
ruby 2.6.5
Rails 6.0.3.4
MySql 5.6.47

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| tel      | string | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages
- has_many :active_relationships
- has_many :followings

## follows テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| target_user | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :target_user

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

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
