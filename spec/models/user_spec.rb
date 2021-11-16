require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "has a valid user" do
      @test_user = User.new;

      @test_user.email = 'meme@abc.com'
      @test_user.firstname = 'tim'
      @test_user.lastname = 'hong'
      @test_user.password = 'password'
      @test_user.password_confirmation = 'password'

      expect(@test_user).to be_valid
    end
    it "fails if no password" do
      @test_user = User.new;

      @test_user.email = 'meme@abc.com'
      @test_user.firstname = 'tim'
      @test_user.lastname = 'hong'
      @test_user.password = nil
      @test_user.password_confirmation = 'password'

      expect(@test_user).not_to  be_valid

    end
    it "fails if no password confirmation" do
      @test_user = User.new;

      @test_user.email = 'meme@abc.com'
      @test_user.firstname = 'tim'
      @test_user.lastname = 'hong'
      @test_user.password = 'password'
      @test_user.password_confirmation = nil

      expect(@test_user).not_to  be_valid
    end
    it "fails if no email" do
      @test_user = User.new;

      @test_user.email = nil
      @test_user.firstname = 'tim'
      @test_user.lastname = 'hong'
      @test_user.password = 'password'
      @test_user.password_confirmation = 'password'

      expect(@test_user).not_to  be_valid
    end
    it "fails if no firstname" do
      @test_user = User.new;

      @test_user.email = 'meme@abc.com'
      @test_user.firstname = nil
      @test_user.lastname = 'hong'
      @test_user.password = 'password'
      @test_user.password_confirmation = 'password'

      expect(@test_user).not_to  be_valid
    end
    it "fails if no lastname" do
      @test_user = User.new;

      @test_user.email = 'meme@abc.com'
      @test_user.firstname = 'tim'
      @test_user.lastname = nil
      @test_user.password = 'password'
      @test_user.password_confirmation = 'password'

      expect(@test_user).not_to  be_valid
    end
    it "fails if password too short email" do
      @test_user = User.new;

      @test_user.email = "meme@abc.com"
      @test_user.firstname = 'tim'
      @test_user.lastname = 'hong'
      @test_user.password = 'pass'
      @test_user.password_confirmation = 'pass'

      expect(@test_user).not_to  be_valid
    end

    it "fails if no unique email" do
      @test_user = User.new;

      @test_user.email = "tom.zhang989@gmail.com"
      @test_user.firstname = 'tim'
      @test_user.lastname = 'hong'
      @test_user.password = 'password'
      @test_user.password_confirmation = 'password'
      @test_user.save

      @test_user2 = User.new;

      @test_user2.email = "tom.zhang989@gmail.com"
      @test_user2.firstname = 'tim'
      @test_user2.lastname = 'hong'
      @test_user2password = 'password'
      @test_user2.password_confirmation = 'password'
      @test_user2.save

      expect(@test_user2).not_to  be_valid
    end

  end
  describe '.authenticate_with_credentials' do
    it 'returns nil if the wrong email is given' do
      @test_user = User.authenticate_with_credentials('abc@123.com', 'password')
      expect(@test_user).to be_nil
    end
    it 'returns nil if the wrong password is given' do
      @test_user = User.authenticate_with_credentials('tom.zhang989@gmail.com', 'hungrya')
      expect(@test_user).to be_nil
    end
    it 'returns user if the correct password and email is given' do
      @test_user2 = User.new;

      @test_user2.email = "tom.zhang989@gmail.com"
      @test_user2.firstname = 'tim'
      @test_user2.lastname = 'hong'
      @test_user2.password = 'password'
      @test_user2.password_confirmation = 'password'
      @test_user2.save

      @test_user = User.authenticate_with_credentials("tom.zhang989@gmail.com", "password")
      expect(@test_user).not_to be_nil
    end  
    it 'returns user if the email has leading/trailing spaces' do
      @test_user2 = User.new;

      @test_user2.email = "tom.zhang989@gmail.com"
      @test_user2.firstname = 'tim'
      @test_user2.lastname = 'hong'
      @test_user2.password = 'password'
      @test_user2.password_confirmation = 'password'
      @test_user2.save

      @test_user = User.authenticate_with_credentials("  tom.zhang989@gmail.com  ", 'password')
      expect(@test_user).not_to be_nil
    end 
    it 'returns user if the email has various cases' do
      @test_user2 = User.new;

      @test_user2.email = "tom.zhang989@gmail.com"
      @test_user2.firstname = 'tim'
      @test_user2.lastname = 'hong'
      @test_user2.password = 'password'
      @test_user2.password_confirmation = 'password'
      @test_user2.save

      @test_user = User.authenticate_with_credentials("tom.zHANg989@gmail.com", 'password')
      expect(@test_user).not_to be_nil
    end 
  end
  

end
