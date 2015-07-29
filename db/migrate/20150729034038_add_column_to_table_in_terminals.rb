class AddColumnToTableInTerminals < ActiveRecord::Migration
  def change
  	add_reference :in_terminals, :user, index: true
	add_foreign_key :in_terminals, :users

	remove_column :in_terminals, :total_p
	add_column :in_terminals, :total_p, :integer, null: false, default: 0
  end
end
