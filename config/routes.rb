Rails.application.routes.draw do
  get 'todolists/new'
  # todolistsページにアクセスした際にnewアクション(空のクラスがモデルに設定)が実行
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'homes#top'
  # getメソッドでtopをクリックしたらhomesコントローラーのtopアクションが呼び出される
  post 'todolists' => 'todolists#create'
  # todolistsのURLにPOSTメソッドでアクセスしたときにtodolistsコントローラーのcreateアクションが呼び出される
  get 'todolists' => 'todolists#index'

  get 'todolists/:id' => 'todolists#show', as: 'todolist'
  # 投稿の詳細画面を作成するため、コントローラにshowアクションを作成します。
  # 詳細画面では、どの投稿データを表示するかを判別するために、投稿データのidもURLに含めます。
  # 例えば/todolists/1 /todolists/3のように
  # as: '名前' は「名前付きルート」といい、コード内でURLをわかりやすく書くために使われます。
  # ここでは、「'todolists#show'の設定を、todolistとして利用できる」の意味になります
  get 'todolists/:id/edit' => 'todolists#edit', as: 'edit_todolist'
  # todolists/:id/editのように、ルーティングのURLに:idを用いて記述すると、todolists/◯◯/editのすべてのURLが対象になります。

  patch 'todolists/:id' => 'todolists#update', as: 'update_todolist'
  # 更新の場合はPATCHで指定します。
  
  delete 'todolists/:id' => 'todolists#destroy', as: 'destroy_todolist'
end
