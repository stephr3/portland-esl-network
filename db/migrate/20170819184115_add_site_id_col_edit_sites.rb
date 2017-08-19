class AddSiteIdColEditSites < ActiveRecord::Migration[5.0]
  def change
    add_column :edit_sites, :site_id, :integer
  end
end
