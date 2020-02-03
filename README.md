#  はじめに
これはsinatora + PostgreSQLを使った簡単なアプリケーションです。

## 事前準備
ローカル環境にPostgreSQLのパッケージがインストールされて、
PostgreSQLが動いているサーバが存在する必要があります。

## 環境設定
- ルートディレクトリにある `.env.sample` を参考に環境変数にPostgreSQLの情報を記載してください。
- PostgreSQLのDBを準備するためには、 `bundle exec rake initializaion_db:create_db` と `bundle exec rake initializaion_db:create_table` を実行してください
