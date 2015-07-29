class CreateInTaxes < ActiveRecord::Migration
  def change
    create_table :in_taxes do |t|
      t.references :product, index: true, foreign_key: true
      t.references :tax, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
