Rails.application.routes.draw do
  get 'todolists/new'
  # todolistsページにアクセスした際にnewアクション(空のクラスがモデルに設定)が実行
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'homes#top'
  # getメソッドでtopをクリックしたらhomesコントローラーのtopアクションが呼び出される
  post 'todolists' => 'todolists#create'
  # todolistsのURLにPOSTメソッドでアクセスしたときにtodolistsコントローラーのcreateアクションが呼び出される 
end
