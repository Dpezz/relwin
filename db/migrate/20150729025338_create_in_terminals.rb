class CreateInTerminals < ActiveRecord::Migration
  def change
    create_table :in_terminals do |t|
      t.references :terminal, index: true, foreign_key: true
      t.references :vendor, index: true, foreign_key: true
      t.integer :start_p
      t.integer :total_p
      t.integer :end_p
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
