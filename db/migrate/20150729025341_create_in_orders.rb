class CreateInOrders < ActiveRecord::Migration
  def change
    create_table :in_orders do |t|
      t.references :order, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :unit_o
      t.integer :unit_r

      t.timestamps null: false
    end
  end
end
