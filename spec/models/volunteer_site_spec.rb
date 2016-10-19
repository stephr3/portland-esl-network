require 'rails_helper'

describe VolunteerSite do
  it { should validate_presence_of :name }
  it { should validate_presence_of :url }
  it { should validate_presence_of :address }
  it { should validate_presence_of :level }
  it { should validate_presence_of :contact }
  it { should validate_presence_of :description }
  it { should validate_length_of(:name).is_at_most(200) }
  it { should validate_length_of(:url).is_at_most(70) }
  it { should validate_length_of(:address).is_at_most(200) }
  it { should validate_length_of(:level).is_at_most(20) }
  it { should validate_length_of(:contact).is_at_most(200) }
  it { should validate_length_of(:description).is_at_most(1000) }
end
