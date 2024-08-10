class CreatePeaks < ActiveRecord::Migration[7.1]
  def change
    create_table :peaks do |t|

      t.timestamps
    end
  end
end
