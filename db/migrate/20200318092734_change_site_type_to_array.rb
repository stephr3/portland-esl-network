class ChangeSiteTypeToArray < ActiveRecord::Migration[5.0]
	def change
	  change_column :sites, :site_type, "varchar[] USING (string_to_array(site_type, ','))"
	end
end
