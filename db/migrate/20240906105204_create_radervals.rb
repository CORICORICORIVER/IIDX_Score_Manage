class CreateRadervals < ActiveRecord::Migration[7.1]
  def change
    create_table :radervals do |t|
      t.string :title
      t.float :notes
      t.float :chord
      t.float :peak
      t.float :charge
      t.float :scratch
      t.float :soflan      
      t.integer :maxscore
      t.timestamps
    end
  end
end
