class User < ActiveRecord::Base

  public 
  has_many :orders
  has_secure_password

  def authenticate_with_credentials (email, pass)
    if (user.authenticate(pass))
      return user.find_by_email(email)
    else
      return nil
    end
  end

  validates :email, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  validates :password, length: { minimum: 6 }
  # validates :email, uniqueness: {scope: :email}

end
