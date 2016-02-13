class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :rut
      t.string :name
      t.string :address
      t.string :phone
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
