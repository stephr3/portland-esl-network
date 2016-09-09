require 'rails_helper'

describe Site do
  it { should validate_presence_of :name }
  it { should validate_presence_of :address }
  it { should validate_presence_of :city }
  it { should validate_presence_of :country }
  it { should validate_presence_of :zip }
  it { should validate_presence_of :region }

  it { should validate_length_of(:name).is_at_most(70) }
  it { should validate_length_of(:address).is_at_most(70) }
  it { should validate_length_of(:contact).is_at_most(70) }
  it { should validate_length_of(:email).is_at_most(70) }

  it { should validate_length_of(:city).is_at_most(30) }
  it { should validate_length_of(:state).is_at_most(2) }
  it { should validate_length_of(:zip).is_at_most(5) }
  it { should validate_length_of(:description).is_at_most(3000) }
  it { should validate_length_of(:phone).is_at_most(25) }
  it { should validate_length_of(:url).is_at_most(200) }
  it { should validate_length_of(:notes).is_at_most(2000) }
  it { should validate_numericality_of(:students_served).is_less_than_or_equal_to(1000000) }
  # it { should validate_numericality_of(:zip) }
end
