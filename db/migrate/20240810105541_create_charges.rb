class CreateCharges < ActiveRecord::Migration[7.1]
  def change
    create_table :charges do |t|

      t.timestamps
    end
  end
end
