require 'rails_helper'

describe 'the view a site process', vcr: true do
  it 'views an individual site' do
    FactoryGirl.create(:site)
    visit sites_path
    click_on 'Sunshine ESL Class'
    expect(page).to have_content '123 ABC St'
  end
end
