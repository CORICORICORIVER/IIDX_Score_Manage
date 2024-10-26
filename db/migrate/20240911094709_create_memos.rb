class CreateMemos < ActiveRecord::Migration[7.1]
  def change
    create_table :memos do |t|
      t.integer :raderval_id
      t.integer :user_id
      t.string :version
      t.string :title
      t.string :genre
      t.string :playcount
      t.string :difficulty
      t.integer :exscore
      t.float :notes
      t.float :chord
      t.float :peak
      t.float :charge
      t.float :scratch
      t.float :soflan
      t.float :notes_growth_rate
      t.float :chord_growth_rate
      t.float :peak_growth_rate
      t.float :charge_growth_rate
      t.float :scratch_growth_rate
      t.float :soflan_growth_rate
      t.text :description
      t.timestamps
    end
  end
end


