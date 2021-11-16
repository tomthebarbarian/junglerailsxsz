class User < ActiveRecord::Base

  public 
  has_many :orders
  has_secure_password

  def self.authenticate_with_credentials (email, pass)
    edited_email = email.squish
    edited_email = edited_email.downcase
    
    user = User.find_by_email(edited_email)
    # puts "this is user",user
    if (user && user.authenticate(pass))
      return user
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
  validates :email, uniqueness: true

end
