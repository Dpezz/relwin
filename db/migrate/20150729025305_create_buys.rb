class CreateBuys < ActiveRecord::Migration
  def change
    create_table :buys do |t|
      t.datetime :date
      t.integer :price
      t.references :ticket, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
