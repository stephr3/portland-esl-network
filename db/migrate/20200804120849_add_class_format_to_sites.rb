class AddClassFormatToSites < ActiveRecord::Migration[5.0]
  def change
  	add_column :sites, :class_format, :string 
  end
end
