require 'rails_helper'

feature 'Add to cart', js: true do
  let!(:table) { create :customer_table }
  let!(:products) do
    4.times { create :product }
  end

  example 'adds the selected product to the order summary page' do
    visit customer_table_path(table)
    first('a', '.order', text: "Add to order").click
    click_link "Order Summary"
    expect(page).to have_content Product.first.name
  end
end