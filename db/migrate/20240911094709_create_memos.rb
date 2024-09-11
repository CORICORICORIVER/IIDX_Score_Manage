class CreateMemos < ActiveRecord::Migration[7.1]
  def change
    create_table :memos do |t|
      t.integer :raderval_id
      t.string :バージョン
      t.string :タイトル
      t.string :ジャンル
      t.string :プレー回数
      t.float :A_NOTES
      t.float :A_CHORD
      t.float :A_PEAK
      t.float :A_CHARGE
      t.float :A_SCRATCH
      t.float :A_SOFLAN
      t.text :description
      t.timestamps
    end
  end
end


