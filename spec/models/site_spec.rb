require 'rails_helper'

describe Site do
  it { should validate_presence_of :name }
  it { should validate_presence_of :address }
  it { should validate_presence_of :city }
  it { should validate_presence_of :country }
  it { should validate_presence_of :zip }
  it { should validate_presence_of :region }
end
