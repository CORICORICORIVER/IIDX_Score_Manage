class CreateSoflans < ActiveRecord::Migration[7.1]
  def change
    create_table :soflans do |t|
      t.string :title
      t.string :バージョン
      t.string :タイトル
      t.string :ジャンル
      t.string :プレー回数
      t.text :description
      t.timestamps
    end
  end
end
