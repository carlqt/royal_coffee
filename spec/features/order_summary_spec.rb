require 'rails_helper'

feature 'Order summary', js: true do
  let!(:table) { create :customer_table }
  background do
    4.times do
      prod = create :product
      table.add_item(product_id: prod.id, size: 'venti', price: prod.venti_price)
    end
  end

  example 'computes the total items' do
    visit current_order_customer_table_path(table)
    expect(page).to have_content "$40.00"
  end

  example 'order now button moves the contents to total summary page' do
    visit current_order_customer_table_path(table)
    click_link "Order Now"
    visit total_order_customer_table_path(table)
    expect(page).to have_content "$40.00"
  end
end