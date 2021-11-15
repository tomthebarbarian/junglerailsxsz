class User < ActiveRecord::Base
  has_many :orders
  has_secure_password

  validates :email, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
