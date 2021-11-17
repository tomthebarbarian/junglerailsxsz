require 'rails_helper'

RSpec.feature "Visitor clicks add to cart and increments my cart by 1", type: :feature do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see the add to cart button" do
   # ACT
   visit root_path

   # DEBUG / VERIFY
  #  save_screenshot
   expect(page).to have_css 'button .fa.fa-shopping-cart', count: 10
  end

  scenario "They can click the add to cart button and increment the cart" do
    # ACT
    visit root_path
 
    # DEBUG / VERIFY
    find("body > main > section > div > article:nth-child(1) button").click
    
    within('#navbar > ul.nav.navbar-nav.navbar-right > li:nth-child(2)') {expect(page).to have_content('My Cart (1)')}
  #navbar > ul.nav.navbar-nav.navbar-right > li:nth-child(2) > a > i
  end
end