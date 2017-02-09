class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :description
      t.string :address
      t.integer :status
      t.references :user, foreign_key: true
      t.references :album, foreign_key: true
      t.references :shop_type, foreign_key: true

      t.timestamps
    end
  end
end
