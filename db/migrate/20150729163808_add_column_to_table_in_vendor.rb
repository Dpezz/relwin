class AddColumnToTableInVendor < ActiveRecord::Migration
  def change
  	add_column :in_vendors, :total_p, :integer
  end
end
