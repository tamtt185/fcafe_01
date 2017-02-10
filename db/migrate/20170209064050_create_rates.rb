class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.integer :target_id
      t.integer :target_type
      t.integer :num_rate
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
