class Site < ActiveRecord::Base

  validates :name, :address, :city, :state, :region, presence: true
  validates :name, :address, :contact, :email, length: { maximum: 70 }
  validates :city, length: { maximum: 30 }
  validates :state, length: { maximum: 2 }
  validates :zip, length: { maximum: 5 }
  validates :description, length: { maximum: 3000 }
  validates :phone, length: { maximum: 25 }
  validates :url, length: { maximum: 200 }
  validates :notes, length: { maximum: 2000 }

  scope(:north_northeast, -> do
    where({:region => "North/Northeast"})
  end)

  scope(:south_southeast, -> do
    where({:region => "South/Southeast"})
  end)

  scope(:southwest, -> do
    where({:region => "Southwest"})
  end)

  scope(:downtown, -> do
    where({:region => "Downtown"})
  end)

  scope(:gresham, -> do
    where({:region => "Gresham"})
  end)

  scope(:washington_county, -> do
    where({:region => "Washington County"})
  end)

  scope(:clark_county, -> do
    where({:region => "Clark County"})
  end)

  scope(:other_areas, -> do
    where({:region => "Other Areas"})
  end)

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
