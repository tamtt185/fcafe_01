class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :tables do |t|
      t.string :name
      t.string :avatar
      t.string :location
      t.integer :status
      t.integer :num_chair
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
