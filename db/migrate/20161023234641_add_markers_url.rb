class AddMarkersUrl < ActiveRecord::Migration[5.0]
  def change
    add_column :sites, :markers_url, :string
  end
end
