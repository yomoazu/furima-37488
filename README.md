アプリケーション名	
　　FURIMAアプリ

アプリケーション概要	
　　様々な商品を購入できる
　　また、新規登録すれば商品を自ら出品することもできる

URL※	


テスト用アカウント	

　・Basic認証パスワード
　・Basic認証ID
　・メールアドレス
　・パスワード

利用方法	
　新規会員情報入力
　投稿された商品を閲覧、購入することができる
　”出品する”ボタンを押し、商品情報を入力すると
　自ら商品を出品することもできる
　”購入画面に進む”ボタンを押し支払い情報を入力すると
　購入することができる

アプリケーションを作成した背景	
このアプリケーションは、多忙のため中々買い物に行けない方や
現在のコロナ禍において外出自粛されている方、断捨離で処分されたい方など
ネットを通じてお手軽に出品、購入できる広場を作りたいと考えた

洗い出した要件


実装した機能についての画像やGIFおよびその説明※	


実装予定の機能	
洗い出した要件の中から、今後実装予定の機能がある場合は、その機能を記載。

データベース設計	ER図を添付。
https://gyazo.com/6cce8aad95a1da08ec59d96b0d33d5ae


画面遷移図
https://gyazo.com/23e4dc6d70c62044539ea95cb4fdc79e	

開発環境	
　フロントエンド
　バックエンド
　インフラ
　テスト
　テキストエディタ
　タスク管理


ローカルでの動作方法※	
　以下のコマンドを順に実行
 % git clone
 % cdXXXXXX
 % bundle install
 % yarn install



工夫したポイント※	


# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| ----------------------| ------ | ----------- |
| name                  | string | null: false |
| email                 | string | null: false,unique: true |
| encrypted_password    | string | null: false |
| first_name            | string | null: false |
| first_name_furigana   | string | null: false |
| last_name             | string | null: false |
| last_name_furigana    | string | null: false |
| date_of_bath　　 　    | date   | null: false |

- has_many :items
- has_many :orders
- has_many :address

## items テーブル

| Column                | Type    | Options     |
| ------                | ------- | ----------- |
| product_name          | string  | null: false |
| description_of_item   | text    | null: false |
| category_id           | integer | null: false |
| product_condition_id  | integer | null: false |
| delivery_charge_id    | integer | null: false |
| area_id               | integer | null: false |
| shipping_day_id       | integer | null: false |
| price                 | integer | null: false |
| user                  | references | null: false, foreign_key: true |

- belongs_to :user
- has_one :order


## orders テーブル

| Column                | Type       | Options                        |
| ----------------------| ---------- | ------------------------------ |
| user                  | references | null: false, foreign_key: true |
| item                  | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column                | Type       | Options                        |
| ----------------------| ---------- | -------------------------------|
| post_code             | string     | null: false                    |
| area_id               | integer    | null: false                    |
| municipality          | string     | null: false                    |
| address               | string     | null: false                    |
| Building name         | string     |                                |
| phone number   　　　  | string     | null: false                    |
| order                 | references | null: false, foreign_key: true |
- belongs_to :order
