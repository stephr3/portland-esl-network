class Link < ActiveRecord::Base
  validates :title, :url, :description, :tag, :page, presence: true
  validates :title, length: { maximum: 300 }
  validates :url, length: { maximum: 300 }
  validates :description, length: { maximum: 1000 }
  validates :tag, length: { maximum: 20 }
  paginates_per 10
end
