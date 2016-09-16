require 'rails_helper'

describe "the delete a site process" do
  it "deletes a site" do
    site = FactoryGirl.create(:site)
    visit site_path(site)
    click_on "Delete this Class"
    expect(page).to have_no_content 'Sunshine ESL Class'
  end
end
