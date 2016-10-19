require 'rails_helper'

describe 'the view links process' do
  it 'views student learning links' do
    link = FactoryGirl.create(:link)
    visit '/links?type=learning'
    expect(page).to have_content 'Multnomah County Library Web Resources'
  end

  it 'views teaching resources links' do
    link = FactoryGirl.create(:link, page: 'Teaching Resources')
    visit '/links?type=teaching'
    expect(page).to have_content 'Multnomah County Library Web Resources'
  end

  it 'views refugee backgrounders links' do
    link = FactoryGirl.create(:link, page: 'Refugee Backgrounders')
    visit '/links?type=refugees'
    expect(page).to have_content 'Multnomah County Library Web Resources'
  end
end
