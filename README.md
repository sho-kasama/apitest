## railsでWeb APIを叩いた

- WebAPIはJSON形式のデータを返す
- GETメソッドで情報を取得するパターンのみ
- 処理成功時にはHashに変換したデータを出力し、処理失敗時はロガーでログを残して終了する


- <a href="https://github.com/sho-kasama/apitest/blob/master/app/controllers/address_controller.rb">詳しくはこちらのコードで</a>


## 用語説明

#### require net/http

```
require 'net/http' ← 汎用データ転送プロトコル HTTP を扱うライブラリです、GETして表示するだけ
```

<br>

#### URI.encode_www_form

URLの中で使用する文字列をエスケープする時には```URI.encode_www_form```メソッドを使用する


<br>


#### JSON.parseとは

JSON.parseとは、JSON(ジェイソン)形式の文字列をRubyのHash(ハッシュ)形式に変換するためのメソッド





## 参考記事

- <a href="https://qiita.com/mogulla3/items/a4bff2e569dfa7da1896">RubyでWebAPIを叩く</a>
- <a href="https://qiita.com/busyoumono99/items/9b5ffd35dd521bafce47">WebAPIについての説明</a>
- <a href="https://qiita.com/TeQuiLayy/items/abb29641892e7c459620">URI.encodeのこと</a>
