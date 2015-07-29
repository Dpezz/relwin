class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :address
      t.text :description
      t.boolean :is_active
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
