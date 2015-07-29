class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :rut
      t.string :name
      t.string :plastname
      t.string :mlastname
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
