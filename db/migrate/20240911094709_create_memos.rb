class CreateMemos < ActiveRecord::Migration[7.1]
  def change
    create_table :memos do |t|
      t.integer :raderval_id
      t.string :version
      t.string :title
      t.string :genre
      t.string :playcount
      t.string :difficulty
      t.float :notes
      t.float :chord
      t.float :peak
      t.float :charge
      t.float :scratch
      t.float :soflan
      t.text :description
      t.timestamps
    end
  end
end


