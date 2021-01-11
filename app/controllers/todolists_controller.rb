class TodolistsController < ApplicationController
  def new
    @list = List.new
  end

  def create
      list = List.new(list_params)
      # １. データを新規登録するためのインスタンス作成
      list.save
      # ２. データをデータベースに保存するためのsaveメソッド実行
      redirect_to '/top'
      # ３. トップ画面へリダイレクト
  end

  def index
    @lists = List.all
    # List.allメソッドでは、listsテーブルからすべてのデータを取得し、インスタンス変数@listsに代入します。
    # インスタンス変数にはすべてのデータが取り出されて格納されるため、インスタンス変数名を複数形にしています。
  end

  private
  # ストロングパラメータ
  # フォームからデータを送信するときは、「マスアサインメント脆弱性」というセキュリティ上の問題があります。
  # （簡単に伝えると、データ送信時に不正なリクエストによって、予期しない値を変更されてしまう脆弱性です）
  # Railsでは、この脆弱性を防ぐ「ストロングパラメータ」の仕組みが用意されています。
   # この仕組みがprivateの行から下のコードになります。
  #  privateは一種の境界線で、「ここから下はcontrollerの中でしか呼び出せません」という意味があります。
  # そのため、他のアクション（index,show,createなど）を巻き込まないようにprivateはControllerファイルの一番下のendのすぐ上に書いて下さい。


  def list_params
      params.require(:list).permit(:title, :body)
    #ストロングパラメータの構文はこのようにおおよそ決まっている
  end
end