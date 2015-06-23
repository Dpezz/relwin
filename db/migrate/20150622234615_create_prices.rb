class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.references :product, index: true, foreign_key: true
      t.integer :costo
      t.integer :venta
      t.integer :margen
      t.integer :iva

      t.timestamps null: false
    end
  end
end
