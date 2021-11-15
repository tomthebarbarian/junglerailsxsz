require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "has a valid user" do
      test_user = User.new;

      test_user.username = 'meme'
      test_user.password = 'password'
      test_user.password_confirmation = 'password'

      expect(test_user).to be_valid
    end
    it "fails if no password" do
    end
    it "fails if no password confirmation" do
    end
    it "fails if no email" do
    end
    it "fails if no unique email" do
    end
    it "fails if no firstname" do
    end
    it "fails if no lastname" do
    end
  end
end
