require 'rails_helper'

describe 'the view volunteer sites process' do
  it 'views volunteer sites' do
    FactoryGirl.create(:volunteer_site)
    visit '/real-world'
    expect(page).to have_content 'Birch Community Services'
  end
end
