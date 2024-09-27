class CreateRadervals < ActiveRecord::Migration[7.1]
  def change
    create_table :radervals do |t|
      t.string :title
      t.float :notesval
      t.float :chordval
      t.float :peakval
      t.float :chargeval
      t.float :scratchval
      t.float :soflanval  
      t.integer :maxscore
      t.float :l_notesval
      t.float :l_chordval
      t.float :l_peakval
      t.float :l_chargeval
      t.float :l_scratchval
      t.float :l_soflanval
      t.integer :l_maxscore
      t.timestamps
    end
  end
end
