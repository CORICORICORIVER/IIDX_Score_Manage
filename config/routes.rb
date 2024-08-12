#routeを設定するための関数（あんま気にしなくていい？）
Rails.application.routes.draw do
  #メモ帳作成
  get "memos" => 'memos#index'
  #ソフラン用memoに飛ぶ
  get "soflan" => 'memos#soflan'
  #CSVファイル読み込み
  get "csv" => 'memos#csv'

  get "up" => "rails/health#show", as: :rails_health_check

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
  
  resources :soflan do
    #importクラスを追加
    collection do
      post :import
      delete :destroy_all
    end
  end
end

