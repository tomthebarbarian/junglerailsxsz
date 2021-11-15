require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is valid whatsoever' do
      testProduct = Product.new

      testProduct.name = 'testname'
      testProduct.price = 2100
      testProduct.quantity = 17
      testProduct.category_id = 1

      expect(testProduct).to be_valid
    end
    it "has a name" do
      # testProduct.valid?

      testProduct = Product.new
      testProduct.name = nil
      testProduct.price = 2100
      testProduct.quantity = 17
      testProduct.category_id = 1

      puts testProduct.name
      expect(testProduct.name).to be_nil
    end
    it "has a price" do
      testProduct = Product.new

      # testProduct.valid?
      testProduct.name = 'testname'
      testProduct.quantity = 17
      testProduct.category_id = 1
      testProduct.price = nil # price in cents

      expect(testProduct[:price]).to be_nil
    end
    it "has a quantity" do
      testProduct = Product.new

      # testProduct.valid?
      testProduct.name = 'testname'
      testProduct.category_id = 1
      testProduct.quantity = nil
      testProduct.price = 2100

      expect(testProduct[:quantity]).to be_nil
    end
    it "has a category" do
      testProduct = Product.new

      # testProduct.valid?
      testProduct.name = 'testname'
      testProduct.price = 2100
      testProduct.quantity = 17
      testProduct.category_id = nil
      expect(testProduct[:category_id]).to be_nil
    end
    it "be nil" do
      expect(nil).to be_nil
    end
  end
end
