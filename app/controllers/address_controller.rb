require 'net/http' # 汎用データ転送プロトコル HTTP を扱うライブラリです。GETして表示させるだけなら一行で大丈夫


class AddressController < ApplicationController
  def show
    # hash形式でパラメタ文字列を指定し、URL形式にエンコードする
    params = URI.encode_www_form({zipcode: '7830060'})
    # URIを解析し、hostやpostをバラバラに取得できるようにする
    uri = URI.parse("http://zipcloud.ibsnet.co.jp/api/search?#{params}")
    # リクエストパラメタをインスタンス変数に格納
    @query = uri.query

    # 新しくHTTPセッションを開始し、結果をresponceへ格納
    response = Net::HTTP.start(uri.host, uri.port) do |http|

      # 接続時にもつ最大秒数を設定
      http.open_timeout = 5
      
      # 読み込み一回でブロックして良い最大秒数を設定
      http.read_timeout = 10

      # ここでWebAPIを叩いている
      # Net::HTTPResponseのインスタンスが返ってくる
      http.get(uri.request_uri)
    end

    begin
      # responceの値に応じて処理を分ける
      case responce
      # 成功した場合
      when Net::HTTPSuccess
        # responceのbody要素をJSON形式で解釈し、hashに変換する
        @result = JSON.parse(responce.body)

        # 表示用の変数に結果を格納
        @zipcode = @result["results"][0]["zipcode"]
        @address1 = @result["results"][0]["address1"]
        @address2 = @result["results"][0]["address2"]
        @address3 = @result["results"][0]["address3"]

      # 別のURLに飛ばされた場合
      when Net::HTTPRedirection
        @message = "Redirection: code=#{responce.code} message=#{response.message}"
      # そのほかエラー
      else 
        @message = "HTTP ERROR: code=#{response.code} message=#{response.message}"
      end

    # エラー時処理
  rescue IOError => e
    @message = "e.message"
  rescue TimeoutError => e
    @message = "e.message"
  rescue JSON::ParserError => e
    @message = "e.message"
  rescue => e
    @message = "e.message"
  end
  end
end
