require 'rails_helper'

describe 'the view volunteer sites process', vcr: true do
  it 'views volunteer sites' do
    FactoryGirl.create(:volunteer_site)
    visit '/real-world'
    expect(page).to have_content 'Birch Community Services'
  end

  it 'filters sites by beginner level' do
    FactoryGirl.create(:volunteer_site)
    visit '/real-world'
    click_on 'Beginner'
    expect(page).to have_no_content 'Birch Community Service'
  end

  it 'filters sites by intermediate level' do
    FactoryGirl.create(:volunteer_site)
    visit '/real-world'
    click_on 'Intermediate'
    expect(page).to have_no_content 'Birch Community Service'
  end

  it 'filters sites by advanced level' do
    FactoryGirl.create(:volunteer_site)
    visit '/real-world'
    click_on 'Advanced'
    expect(page).to have_no_content 'Birch Community Service'
  end

  it 'filters sites by all levels accepted' do
    FactoryGirl.create(:volunteer_site, level: 'Beginner')
    visit '/real-world'
    click_on 'All Levels Accepted'
    expect(page).to have_no_content 'Birch Community Service'
  end

  it 'paginates sites' do
    FactoryGirl.create_list(:volunteer_site, 6)
    visit volunteer_sites_path
    expect(page).to have_content 'Next ›'
  end
end
