class Site < ActiveRecord::Base
  validates :name, :address, :city, :country, :zip, :region, :presence => true
end
