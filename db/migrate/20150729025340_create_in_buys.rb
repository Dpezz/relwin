class CreateInBuys < ActiveRecord::Migration
  def change
    create_table :in_buys do |t|
      t.references :buy, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :unit

      t.timestamps null: false
    end
  end
end
