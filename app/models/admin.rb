class Admin < ActiveRecord::Base
  attr_accessor :password
  validates :username, :password, presence: true, on: :create
  validates :password, length: { minimum: 4 }, on: :create
  before_save :encrypt_password

  def encrypt_password
    self.salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, salt)
  end

  def self.authenticate(username, password)
    admin = Admin.where(username: username).first
    if admin && admin.password_hash == BCrypt::Engine.hash_secret(password, admin.salt)
      admin
    else
      nil
    end
  end
end
