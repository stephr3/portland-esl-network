class AddVolunteerColsToSites < ActiveRecord::Migration[5.0]
  def change
    add_column :sites, :volunteers_needed, :boolean
    add_column :sites, :vol_coordinator_name, :string
    add_column :sites, :vol_contact, :string
    add_column :sites, :vol_time_commitment, :string
    add_column :sites, :vol_time_slots, :string
    add_column :sites, :vol_assignment_type, :string
    add_column :sites, :vol_training_offered, :boolean
  end
end
