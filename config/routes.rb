#routeを設定するための関数（あんま気にしなくていい？）
Rails.application.routes.draw do
  #メモ帳作成
  get "memo" => 'memos#index'

  #CSVファイル読み込み
  get "csv" => 'memos#csv'

  get "up" => "rails/health#show", as: :rails_health_check

  #ホームページ
  root 'memos#home'
  resources :memos do
    collection {post :import}
  end
  resources :memos, only: [:index, :update, :destroy, :create, :import]
end

