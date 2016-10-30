class VolunteerSite < ActiveRecord::Base
  paginates_per 5
  validates :name, :url, :level, :contact, :description, presence: true
  validates :name, length: { maximum: 200 }
  validates :url, length: { maximum: 200 }
  validates :address, length: { maximum: 70 }
  validates :city, length: { maximum: 30 }
  validates :state, length: { maximum: 2 }
  validates :zip, length: { maximum: 5 }
  validates :level, length: { maximum: 20 }
  validates :contact, length: { maximum: 200 }
  validates :description, length: { maximum: 1000 }

  #For Geocoder Functionality
  geocoded_by :geocoder_address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? or obj.city_changed? or obj.state_changed? or obj.zip_changed? }
  after_validation :lat_changed?

  def geocoder_address
    [address, city, state, zip].compact.join(', ')
  end

  def lat_changed?
    if (self.address_changed?) or (self.city_changed?) or (self.zip_changed?)
        if !(self.latitude_changed?)
            self.errors.add(:address, "is not valid.")
            return false
        end
      end
    return true
  end
end
