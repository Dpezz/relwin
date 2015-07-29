class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :product, index: true, foreign_key: true
      t.references :sale, index: true, foreign_key: true
      t.integer :unit

      t.timestamps null: false
    end
  end
end
