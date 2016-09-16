require 'rails_helper'

describe "the delete a site process" do
  it "deletes a site" do
    site = Site.create(name: "ESL Class", address: "123 ABC St", city: "Portland", state: "OR", zip: "97211", description: "A free class!", contact: "Joe Shmo", phone: "971-4567", email: "Joe@esl.com", url: "", class_resource: "Class", site_type: "Church", happening_now: "Yes", notes: "", region: "Downtown", summer_classes: "No", students_served: 100)
    visit site_path(site)
    click_on "Delete this Class"
    expect(page).to have_content 'ESL Classes'
  end
end
