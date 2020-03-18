class AddSiteTypeDefault < ActiveRecord::Migration[5.0]
	def change
	  change_column_default :sites, :site_type, []
	end
end
