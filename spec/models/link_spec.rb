require 'rails_helper'

describe Link do
  it { should validate_presence_of :title }
  it { should validate_presence_of :url }
  it { should validate_presence_of :description }
  it { should validate_presence_of :tag }
  it { should validate_presence_of :page }
  it { should validate_length_of(:title).is_at_most(200) }
  it { should validate_length_of(:url).is_at_most(70) }
  it { should validate_length_of(:description).is_at_most(1000) }
  it { should validate_length_of(:tag).is_at_most(20) }
end
