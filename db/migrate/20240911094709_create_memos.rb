class CreateMemos < ActiveRecord::Migration[7.1]
  def change
    create_table :memos do |t|
      t.integer :raderval_id
      t.string :バージョン
      t.string :タイトル
      t.string :ジャンル
      t.string :プレー回数
      t.string :Difficulty
      t.float :NOTES
      t.float :CHORD
      t.float :PEAK
      t.float :CHARGE
      t.float :SCRATCH
      t.float :SOFLAN
      t.text :description
      t.timestamps
    end
  end
end


