require 'rails_helper'

describe "the edit a site process" do
  it "edits a site" do
    site = Site.create(name: "ESL Class", address: "123 ABC St", city: "Portland", state: "OR", zip: "97211", description: "A free class!", contact: "Joe Shmo", phone: "971-4567", email: "Joe@esl.com", url: "", class_resource: "Class", site_type: "Church", happening_now: "Yes", notes: "", region: "Downtown", summer_classes: "No", students_served: 100)
    visit site_path(site)
    click_on 'Edit Class Information'
    fill_in 'Name', with: 'Best ESL Class'
    select('OR', from: 'site_state')
    select('Downtown', from: 'site_region')
    click_on 'Update Site'
    expect(page).to have_content 'Best ESL Class'
  end

  it "gives error when no name is entered" do
    site = Site.create(name: "ESL Class", address: "123 ABC St", city: "Portland", state: "OR", zip: "97211", description: "A free class!", contact: "Joe Shmo", phone: "971-4567", email: "Joe@esl.com", url: "", class_resource: "Class", site_type: "Church", happening_now: "Yes", notes: "", region: "Downtown", summer_classes: "No", students_served: 100)
    visit site_path(site)
    click_on 'Edit Class Information'
    fill_in 'Name', :with => ''
    click_button 'Update Site'
    expect(page).to have_content 'errors'
  end
end
