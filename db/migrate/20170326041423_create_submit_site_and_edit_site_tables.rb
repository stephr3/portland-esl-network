class CreateSubmitSiteAndEditSiteTables < ActiveRecord::Migration[5.0]
  def change
    create_table :submit_sites do |t|
      t.text :user_name
      t.text :user_email
      t.text :site_name
      t.text :site_address
      t.text :site_contact
      t.text :site_url
      t.text :site_description
      t.timestamps
    end

    create_table :edit_sites do |t|
      t.text :user_name
      t.text :user_email
      t.text :site_updates
      t.timestamps
    end
  end
end
