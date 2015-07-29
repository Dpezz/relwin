class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :code
      t.string :barcode
      t.string :name
      t.references :measure, index: true, foreign_key: true
      t.references :provider, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
