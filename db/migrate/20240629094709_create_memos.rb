class CreateMemos < ActiveRecord::Migration[7.1]
  def change
    create_table :memos do |t|
      t.integer :raderval_id
      t.string :バージョン
      t.string :タイトル
      t.string :ジャンル
      t.string :プレー回数
      t.string :N_SCORE
      t.string :H_SCORE
      t.string :A_SCORE
      t.string :L_SCORE
      t.integer :NOTES
      t.integer :CHORD
      t.integer :PEAK
      t.integer :CHARGE
      t.integer :SCRATCH
      t.integer :SOFLAN      
      t.integer :MAXSCORE
      t.text :description
      t.timestamps
    end
  end
end


