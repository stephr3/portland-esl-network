require 'rails_helper'

describe 'the view sites process', vcr: true do
  it 'views all sites' do
    FactoryGirl.create(:site)
    visit root_path
    expect(page).to have_content 'Sunshine ESL Class'
  end

  it 'filters sites by North/Northeast region' do
    FactoryGirl.create(:site)
    visit root_path
    click_on 'North/Northeast'
    expect(page).to have_no_content 'Sunshine ESL Class'
  end
  it 'filters sites by South/Southeast region' do
    FactoryGirl.create(:site)
    visit root_path
    click_on 'South/Southeast'
    expect(page).to have_no_content 'Sunshine ESL Class'
  end
  it 'filters sites by Southwest region' do
    FactoryGirl.create(:site)
    visit root_path
    click_on 'Southwest'
    expect(page).to have_no_content 'Sunshine ESL Class'
  end
  it 'filters sites by Downtown region' do
    FactoryGirl.create(:site, region: 'Gresham')
    visit root_path
    click_on 'Downtown'
    expect(page).to have_no_content 'Sunshine ESL Class'
  end
  it 'filters sites by Gresham region' do
    FactoryGirl.create(:site)
    visit root_path
    click_on 'Gresham'
    expect(page).to have_no_content 'Sunshine ESL Class'
  end
  it 'filters sites by Washington County region' do
    FactoryGirl.create(:site)
    visit root_path
    click_on 'Washington County'
    expect(page).to have_no_content 'Sunshine ESL Class'
  end
  it 'filters sites by Clark County region' do
    FactoryGirl.create(:site)
    visit root_path
    click_on 'Clark County'
    expect(page).to have_no_content 'Sunshine ESL Class'
  end
  it 'filters sites by Other Areas region' do
    FactoryGirl.create(:site)
    visit root_path
    click_on 'Other Areas'
    expect(page).to have_no_content 'Sunshine ESL Class'
  end
  it 'paginates sites' do
    FactoryGirl.create_list(:site, 6)
    visit root_path
    expect(page).to have_content 'Next ›'
  end
end
