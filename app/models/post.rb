class Post < ActiveRecord::Base
  belongs_to :admin
  validates :title, :content, presence: true
  paginates_per 3
end
