class CreatePays < ActiveRecord::Migration
  def change
    create_table :pays do |t|
      t.references :sale, index: true, foreign_key: true
      t.references :in_terminal, index: true, foreign_key: true
      t.references :payment, index: true, foreign_key: true
      t.string :code

      t.timestamps null: false
    end
  end
end
