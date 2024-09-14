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
      t.float :l_notes
      t.float :l_chord
      t.float :l_peak
      t.float :l_charge
      t.float :l_scratch
      t.float :l_soflan      
      t.integer :l_maxscore
      t.timestamps
    end
  end
end
