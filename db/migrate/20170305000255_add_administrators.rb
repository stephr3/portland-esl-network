class AddAdministrators < ActiveRecord::Migration[5.0]
  def change
    Admin.create(username: "Volunteer", password: "eslnetwork")
    Admin.create(username: "Patrik", password: "eslnetwork")
  end
end
