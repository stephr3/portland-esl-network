class ChangeVolunteerSitesAddressFormat < ActiveRecord::Migration[5.0]
  def change
    add_column :volunteer_sites, :city, :string
    add_column :volunteer_sites, :state, :string
    add_column :volunteer_sites, :zip, :string
    add_column :volunteer_sites, :latitude, :float
    add_column :volunteer_sites, :longitude, :float
  end
end
