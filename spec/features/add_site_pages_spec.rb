require 'rails_helper'

describe "the add a site process" do
  it "adds a new site" do
    visit sites_path
    click_link 'Add a New Class'
    fill_in 'Name', with: 'ESL Class'
    fill_in 'Address', with: "123 ABC Street"
    fill_in 'City', with: "Portland"
    select('OR', from: 'site_state')
    select('Downtown', from: 'site_region')
    click_on 'Submit Class'
    expect(page).to have_content 'ESL Classes'
  end

  it "gives error when no name is entered" do
    visit new_site_path
    click_on 'Submit Class'
    expect(page).to have_content 'errors'
  end
end
