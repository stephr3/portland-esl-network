class VolunteerSite < ActiveRecord::Base
  paginates_per 5
  validates :name, :url, :address, :level, :contact, :description, presence: true
  validates :name, length: { maximum: 200 }
  validates :url, length: { maximum: 200 }
  validates :address, length: { maximum: 200 }
  validates :level, length: { maximum: 20 }
  validates :contact, length: { maximum: 200 }
  validates :description, length: { maximum: 1000 }
end
