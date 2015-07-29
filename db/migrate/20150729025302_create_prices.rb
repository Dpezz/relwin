class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.references :product, index: true, foreign_key: true
      t.integer :buy_p
      t.integer :sale_p
      t.integer :total_p
      t.integer :return
      t.integer :taxes

      t.timestamps null: false
    end
  end
end
