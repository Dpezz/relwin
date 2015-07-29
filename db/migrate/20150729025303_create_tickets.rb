class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :code
      t.integer :price
      t.references :payment, index: true, foreign_key: true
      t.text :note
      t.datetime :date
      t.boolean :is_active
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
