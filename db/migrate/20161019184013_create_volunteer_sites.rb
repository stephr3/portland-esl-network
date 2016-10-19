class CreateVolunteerSites < ActiveRecord::Migration[5.0]
  def change
    create_table :volunteer_sites do |t|
      t.string :name
      t.string :address
      t.string :level
      t.string :contact
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
