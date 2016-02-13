class CreateTaxes < ActiveRecord::Migration
  def change
    create_table :taxes do |t|
      t.references :product, index: true, foreign_key: true
      t.string :name
      t.integer :cantidad
      t.text :description

      t.timestamps null: false
    end
  end
end
