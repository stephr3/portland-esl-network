require 'rails_helper'

describe 'the view posts process' do
  it 'views all posts' do
    post = FactoryGirl.create(:post)
    visit posts_path
    expect(page).to have_content 'New Class at Bridger Elementary'
  end
end
