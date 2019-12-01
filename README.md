# README
#
# 概要
患者さんの管理・予約アプリ
# コンセプト
予約管理アプリ
治療院の情報は、開設者がアプリ作成側に院長情報と治療院作成情報のデータを送り、それを元に作成。アプリ制作側から治療院開設者（院長）admin権限を持ったに企業ID又はメールアドレスとパスワードを発行して渡してログインをしてもらうというような想定で作っています。
admin権限を持っている人のみ、スタッフ作成できる用になっています。
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
      - 治療院の地図（アイフレームで埋め込む）
      - スタッフ一覧紹介(治療家用マイページ編集すると自動的に更新される)
    - 予約機能
      - カレンダーから予約
      - 予約するスタッフを選択
      - 予約が完了すると登録メールに通知が行く
      - 予約の日の朝にメールが届く
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
    - スタッフ一覧
    - 治療院の備品をチェック（在庫管理システム）(予定)
  # カタログ設計・テーブル設計
  https://docs.google.com/spreadsheets/d/1jWZh5IkL2NYuDhnqCsz9F_sX930zMWJb-jbKj-dxNZM/edit?usp=sharing

  # ER図
  https://cacoo.com/diagrams/s7BTGmZw9HFirXPr/01DFF
  # 画面遷移図
  https://cacoo.com/diagrams/s7BTGmZw9HFirXPr/ABFEC
  # 画面ワイヤーフレーム
  https://cacoo.com/diagrams/s7BTGmZw9HFirXPr/8699C
  ### 地図機能
  - google map API
  # 使用予定Gem
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
  ### 検索機能
  gem 'ransack'
  ### 予約機能
  gem 'fullcalendar-rails'
