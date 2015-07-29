class CreateMeasures < ActiveRecord::Migration
  def change
    create_table :measures do |t|
      t.string :name
      t.string :symbol
      t.text :description

      t.timestamps null: false
    end
  end
end
