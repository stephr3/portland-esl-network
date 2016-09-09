class RemoveCountry < ActiveRecord::Migration[5.0]
  def change
    remove_column :sites, :country
  end
end
