#routeを設定するための関数（あんま気にしなくていい？）
Rails.application.routes.draw do
  #ユーザー認証関係のURLを自動生成
  devise_for :users

  #ログアウトの際,GETメソッドではなくDELETEメソッドをリクエストするためのコード
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  #indexページの表示
  get 'memos', to: 'memos#index' , as: 'memos'

  get "up" => "rails/health#show", as: :rails_health_check
  #CSV読み込みページ
  get 'user/:id', to: 'memos#users' , as: 'userpage'
  #それぞれのジャンルのページ
  get "notes" => 'memos#notes'
  get "chord" => 'memos#chord'
  get "peak" => 'memos#peak'
  get "charge" => 'memos#charge'
  get "scratch" => 'memos#scratch'
  get "soflan" => 'memos#soflan'
  #ホームページ
  root 'memos#home'

  #memosの関数として:index, :update, :destroy, :createなどを設定
  resources :memos do
    #importクラスとdestroy_allクラスを追加
    collection do
      post :import
      delete :destroy_all
    end
  end

end

