class TodolistsController < ApplicationController
  def new
    @list = List.new
  end

  def create
      list = List.new(list_params)
      # １. データを新規登録するためのインスタンス作成
      list.save
      # ２. データをデータベースに保存するためのsaveメソッド実行
      redirect_to todolist_path(list.id)
      # show.html.erbへリダイレクトさせて、投稿内容がすぐに閲覧できるようにしましょう
  end

  def index
    @lists = List.all
    # List.allメソッドでは、listsテーブルからすべてのデータを取得し、インスタンス変数@listsに代入します。
    # インスタンス変数にはすべてのデータが取り出されて格納されるため、インスタンス変数名を複数形にしています。
  end
  
  def show
    @list = List.find(params[:id])
    # 詳細画面で呼び出される投稿データは、URLの/todolist/:id内の:idで判別します。
    # この:idは、アクション内にparams[:id]と記述することで取得できます。
    # たとえば、URLが/todolist/1の場合、params[:id] と記述すると、id=1を取り出せます。
    # id=1のデータをfindメソッドを利用してデータベースから取得し、@listへ格納します。
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