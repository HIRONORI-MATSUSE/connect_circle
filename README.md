# README

#

# 概要

治療院検索・管理アプリ

# コンセプト

予約管理アプリ
治療院の情報は、開設者がアプリ作成側に院長情報と治療院作成情報のデータを送り、それを元に作成。アプリ制作側から治療院開設者（院長）admin 権限を持ったに企業 ID 又はメールアドレスとパスワードを発行して渡してログインをしてもらうというような想定で作っています。
admin 権限を持っている人のみ、スタッフ作成できる用になっています。
患者さんはアプリ無料。治療院側から使用料、月５０００円を頂く。

# バージョン

Ruby 2.6.5 Rails 5.2.3

# デプロイ先

- AWS

# 機能一覧

## 患者用

- 登録機能
- ログイン機能
- マイページ
  - 情報の編集
    - 写真設定などもできる
  - 診察券（患者さんの名前、患者番号とＱＲコード（予定）をついている）
  - 治療院情報
    - 診療時間
    - 治療院の検索（アプリ登録治療院の検索）
    - 周辺の治療院検索
    - スタッフ一覧紹介(治療家用マイページ編集すると自動的に更新される)
    - チャット機能（予定）
    - 通院ボタンを押す
  - 予約機能
    - カレンダーから予約（予定）
    - 予約するスタッフを選択（予定）
    - 予約が完了すると登録メールに通知が行く（予定）
    - 予約の日の朝にメールが届く（予定）
  - 過去の治療履歴

## 治療家用

- 治療家登録機能
- 治療家用ログイン機能
- マイページ
  - マイページ編集機能
  - マイページで予約状況が直ぐにわかるようにする
  - 患者さん一覧
    - あいうえお順。
    - 患者さんの名前で検索
    - 来院日と負傷部位と負傷原因と治療内容の登録
    - 患者さんとのチャット機能（予定）
    - 通院するボタンを押した患者さんが治療院の一覧に登録されるようにする
  - スタッフ一覧
  - 治療院の備品をチェック（在庫管理システム）(予定)

# カタログ設計・テーブル設計

https://docs.google.com/spreadsheets/d/1jWZh5IkL2NYuDhnqCsz9F_sX930zMWJb-jbKj-dxNZM/edit?usp=sharing

# ER 図

https://cacoo.com/diagrams/s7BTGmZw9HFirXPr/01DFF

# 画面遷移図

https://cacoo.com/diagrams/s7BTGmZw9HFirXPr/ABFEC

# 画面ワイヤーフレーム

https://cacoo.com/diagrams/s7BTGmZw9HFirXPr/8699C

### 地図機能

- google map API

# 使用予定 Gem

### デバック

gem 'pry-rails'
gem 'better_errors'
gem 'binding_of_caller'

### ログイン機能

gem 'devise'

### 管理者機能

gem 'rails_admin', '~> 2.0'

### 管理者機能(アクセス制限)

gem 'cancancan'

### チャット機能

gem 'devise'

### メール受信機能

gem 'letter_opener_web'

### 画像投稿機能

gem 'carrierwave'
gem 'mini_magick'

### 予約機能

gem 'fullcalendar-rails'
gem 'momentjs-rails'
gem 'jquery-rails'

### 初期データ

gem 'seed-fu'

### ダミーデータ

gem 'faker'
gem 'gimei'

### i18n 日本語化設定

gem 'rails-i18n', '~> 5.1'

### ページネーション

gem 'kaminari'
