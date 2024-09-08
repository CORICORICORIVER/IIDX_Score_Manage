class CreateRadervals < ActiveRecord::Migration[7.1]
  def change
    create_table :radervals do |t|
      t.string :title
      t.integer :NOTES
      t.integer :CHORD
      t.integer :PEAK
      t.integer :CHARGE
      t.integer :SCRATCH
      t.integer :SOFLAN      
      t.integer :MAXSCORE
      t.timestamps
    end
  end
end
