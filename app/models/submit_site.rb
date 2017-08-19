class SubmitSite < ActiveRecord::Base
  validates :user_name, :user_email, :site_name, :site_address, presence: true

  paginates_per 5
end
