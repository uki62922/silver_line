# アプリケーション名
 シルバーライン
# アプリケーション概要
高齢者でも使いやすいチャットアプリです
# URL
# テスト用アカウント
# 利用方法

# 目指した課題解決
#### ①高齢者もチャットがしたいが、使わない機能が多く難しく感じてしまう。
#### ②高齢者にもわかりやすい必要最低限の機能のみ実装
#### ③大きめのフォントサイズや、できるだけ英語を使わないなど、高齢者向けのUIにする
# 洗い出した要件定義
# 実装した機能についてのGIFと説明
- 友達機能
- ユーザー検索機能
- ユーザーアイコン機能
- 左右分岐のチャット機能

# 実装予定の機能
#### スマホアプリ化
#### チャット機能の非同期通信
#### 既読機能
#### 音声通話、ビデオ通話機能
# ローカルでの動作方法

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
