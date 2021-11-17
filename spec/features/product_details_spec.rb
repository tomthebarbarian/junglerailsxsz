require 'rails_helper'

RSpec.feature "Visitor navigates to product_detail", type: :feature, js:true do
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
  scenario "They see the details button on the main page" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    # save_screenshot
    expect(page).to have_css "body > main > section > div > article:nth-child(1) > footer > a"
  end
  scenario "They click on the details button and go to the details page and see Quantity" do
    # ACT
    visit root_path
    find("body > main > section > div > article:nth-child(1) > footer > a").click
    # DEBUG / VERIFY
    # expect(page).to have_css "body > main > section > article > div > div.col-sm-8 > dl > dt:nth-child(5)"
    # save_screenshot
    # puts page.html
    expect(page).to have_content('Quantity')

  end
end
