class CreateInVendors < ActiveRecord::Migration
  def change
    create_table :in_vendors do |t|
      t.references :vendor, index: true, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :is_active
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
