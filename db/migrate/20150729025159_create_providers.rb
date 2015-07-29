class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :rut
      t.string :name
      t.string :address
      t.string :phone
      t.string :url
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
