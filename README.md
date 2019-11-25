# README
#
# 概要
患者さんの管理・予約アプリ
# コンセプト
オリジナルアプリケーション　ユーザーとスタッフのコミュニケーションツール
プライベート（LINEやFacebook、Twitter）と業務用とで使い分ける事で、情報漏洩を未然に無くす。
治療院専用の患者管理ツール。業務在庫管理ツール（予定）。スタッフ間の情報交換。患者さんの情報を共有することができる。
一店舗、月々６０００円から利用可能。患者は登録した治療院の予約やチャットなどができる。使用料は無料。
# バージョン
Ruby 2.5.1 Rails 5.2.3
# 機能一覧
  ## 患者用 
  - 登録機能
  - ログイン機能
  - マイページ
    - 情報の編集
      - 写真設定などもできる
    - 診察券（患者さんの名前、患者番号とＱＲコード（予定）をついている）
    - 治療院情報
      - 診療時間や治療院の地図（google map）
      - スタッフ一覧紹介(治療家用マイページ編集すると自動的に更新される)
      - チャットする（画像（できれば動画や電話）投稿できるようにする）
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
      - あいうえお順や患者番号でソート。
      - 患者さんの名前で検索
      - 電子カルテ（予定）
      - チャット機能（画像や動画も投稿できるようにする）
    - スタッフ一覧
      - チャット機能（画像や動画も投稿できるようにする）
    - 治療院の備品をチェック（在庫管理システム）
  # カタログ設計・テーブル設計
  https://docs.google.com/spreadsheets/d/1jWZh5IkL2NYuDhnqCsz9F_sX930zMWJb-jbKj-dxNZM/edit?usp=sharing

  # ER図・画面遷移図・画面ワイヤーフレーム
  https://cacoo.com/diagrams/s7BTGmZw9HFirXPr/01DFF

  # 使用予定Gem
  gem 'devise'
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener_web'
  gem 'carrierwave'
  gem 'mini_magick'