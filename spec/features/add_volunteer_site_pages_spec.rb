require 'rails_helper'

describe "the add a volunteer site process", vcr: true do
  it "adds a new volunteer site" do
    FactoryGirl.create(:admin)
    visit admin_path
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'admin'
    click_button 'Log in'
    click_link 'Add a New Volunteer Site'
    expect(page).to have_content 'Add a New Volunteer Site'
    fill_in 'Name', with: 'Birch Community Services'
    fill_in 'Url', with: 'http://www.birchcommunityservices.org/participate/volunteer/individual-volunteers/'
    fill_in 'Contact', with: "Andrew Rowlett: 971.506.5673, Andrew@BirchCommunityServices.org"
    fill_in 'Address', with: '17780 NE San Rafael Street'
    select('OR', from: 'volunteer_site_state')
    fill_in 'City', with: 'Portland'
    fill_in 'Zip', with: '97230'
    fill_in 'Description', with: "Opportunities: Food Sorting, Preparing for classes.  Birch can use individual volunteers on M/W/F from 9 am to 5 pm without prior scheduling.  Please plan to volunteer for at least two hours at a time so that we can make the most out of your travel and time commitments. Scheduling is required at all other times by contacting the office at 503.251.5431."
    select('All', from: 'Appropriate Language Level')
    click_button 'Submit Volunteer Site'
    visit '/real-world'
    expect(page).to have_content 'Birch Community Services'
  end

  it 'will not allow a user to add a volunteer site if they are not logged in as an admin' do
    visit volunteer_sites_path
    expect(page).to have_no_content 'Add a New Volunteer Site'
  end

  it 'will return error if name is not filled out' do
    FactoryGirl.create(:admin)
    visit admin_path
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'admin'
    click_button 'Log in'
    visit admin_path
    click_link 'Add a New Volunteer Site'
    fill_in 'Url', with: 'https://www.google.com'
    click_button 'Submit Volunteer Site'
    expect(page).to have_content 'your volunteer site has not been successfully submitted'
  end
end
