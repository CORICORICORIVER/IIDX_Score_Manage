#routeを設定するための関数（あんま気にしなくていい？）
Rails.application.routes.draw do
  #ユーザー認証関係のURLを自動生成
  devise_for :users

  #ログアウトの際,GETメソッドではなくDELETEメソッドをリクエストするためのコード
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  end
  #メモ帳作成
  get "memos" => 'memos#index'
  #CSVファイル読み込み
  get "csv" => 'memos#csv'

  get "up" => "rails/health#show", as: :rails_health_check
  
  get "userpage" => 'memos#userpage'

  get "notes" => 'memos#notes'


  #ホームページ
  root 'memos#home'

  #memosの関数として:index, :update, :destroy, :createなどを設定
  resources :memos do
    #importクラスを追加
    collection do
      post :import
      delete :destroy_all
    end
  end

end

