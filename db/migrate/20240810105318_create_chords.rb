class CreateChords < ActiveRecord::Migration[7.1]
  def change
    create_table :chords do |t|

      t.timestamps
    end
  end
end
