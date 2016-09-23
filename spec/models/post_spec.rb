require 'rails_helper'

describe Post do
  it { should belong_to :admin }

  it { should validate_presence_of :title }
  it { should validate_presence_of :content }
  it { should validate_length_of(:title).is_at_most(200) }
  it { should validate_length_of(:content).is_at_most(1000) }
end
