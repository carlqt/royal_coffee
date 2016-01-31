== README

Checkout the app in heroku: https://pure-scrubland-43057.herokuapp.com/

## Scenario

The app is pretty simple. The scenario is that, the app is found on every table of the coffee shop. That's the meaning of the login screen. Please bear in mind that if you don't select any number, it will just redirect you back to the root path. The user will need to select a table to sit and from there, he can order any of the available drinks.

To order, just select a product then click the "Add to order" link to put the orders on an "Order Summary" screen wherein you can check your orders. If you're satisfied with them, you can click the "Order Now" button the simulate a scenario that your order has been received by the shop and has been delivered to you.

Once the drinks have been delivered, you have to pay for the drinks you have ordered, to do that, click the "Bill Summary" button to be redirected to a receipt page then hit the "Pay Now" button to simulate a payment.

Then that's it, you just enjoyed RoyalTea and please come again.

## Admin

The simple app will let you add products you prefer, just click the "Admin" button on the root path. In the admin page, you can see an "Add Product" button.

At the "Add Product" screen, you will see fields to populate. On the Venti Price, Tall Price and Grande Price fields, if you would like to make the sizes unavailable, just leave them blank.

In this page, you can also see the summary page. This page tracks all sales and groups them by day.

## Answers to optional questions
1. What if we want a new type of coffee, a new type of tea?
  - To add additional drink types, it's easy. Under the `Product` model, I have a column named `drink_type`. This column stores an integer that corresponds to either 0 for coffee or 1 for tea. If you like to add another type of drink like juices, just add in 2 to represent juice and so on...

2. What if we want a new size?
  - My current implementation about sizes are based on columns named something_price. To add a new size, I need to add a migration to add a column named `new_size_price`.

3. How would you change the model to add hot/cold options?
 - Similar answer to #2. I need to add a migration to introduce a new column

4. (optional) How would you change the model to support adding condiments to drinks (perl, grass jelly,...)
  - To support condiments, I would add another column in my `TableItem` model called condiments and make it an hstore. Then I can store a hash to hold the condiments and their quantity.

## Instructions to setup locally

1. Clone the repository
2. Create royal_coffee_development db in postgresql
3. run bundle install in the project
4. run migrations and the seed(rake db:migrate db:seed) and that's it.