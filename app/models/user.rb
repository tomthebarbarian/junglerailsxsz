class User < ActiveRecord::Base
  has_many :orders
  has_secure_password

  validates :username, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
