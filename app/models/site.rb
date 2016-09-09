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
  validates :students_served, numericality: { less_than_or_equal_to: 1000000 }
  # validates :zip, numericality: true
end
