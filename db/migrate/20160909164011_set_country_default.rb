class SetCountryDefault < ActiveRecord::Migration[5.0]
  def change
    change_column :sites, :country, :string, :default => "USA"
  end
end
