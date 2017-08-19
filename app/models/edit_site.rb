class EditSite < ActiveRecord::Base
  validates :user_name, :user_email, :site_updates, presence: true

  paginates_per 5
end
