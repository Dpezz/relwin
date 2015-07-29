class CreateInStocks < ActiveRecord::Migration
  def change
    create_table :in_stocks do |t|
      t.references :stock, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :unit
      t.integer :limit

      t.timestamps null: false
    end
  end
end
