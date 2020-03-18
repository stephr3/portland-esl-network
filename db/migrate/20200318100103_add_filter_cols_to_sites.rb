class AddFilterColsToSites < ActiveRecord::Migration[5.0]
  def change
    add_column :sites, :days_offered, :string, array: true, default: []  	
    add_column :sites, :time_of_day, :string, array: true, default: []  	
    add_column :sites, :childcare, :string  	
    add_column :sites, :registration_required, :string  	
    add_column :sites, :level, :string, array: true, default: []  	
    add_column :sites, :cost, :string, array: true, default: []  	
    add_column :sites, :organization, :string  	
  end
end
