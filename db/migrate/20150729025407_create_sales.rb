class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :desc
      t.integer :total_p
      t.integer :buy_p
      t.references :client, index: true, foreign_key: true
      t.references :in_vendor, index: true, foreign_key: true
      t.boolean :is_active
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
