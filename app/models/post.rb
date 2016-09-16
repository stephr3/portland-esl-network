class Post < ActiveRecord::Base
  belongs_to :admin
  validates :title, :content, presence: true
end
