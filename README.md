# Jungle

Tom's mini e-commerce application built with Rails 4.2.11 for purposes of teaching Rails by example.
## Setup
cd
1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4242 4242 4242 4242
for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2.11 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## What should be visible

### Products index
When the setup is complete you should see the index of all products
the products should have an image, details, price and buttons for add to cart and the details page

If quantity is 0, it should have an additional sold out badge on the image 
and the add to cart button should be disabled

### Product details
each product should have a details page with image, details, price and quantity

### Cart and checkout
you can add them to cart and checkout with a credit card. 

if there are no items in the cart, a message displays instead

there is a button at the end that leads back to the index

### signup and logout
You can click the signup button to put a user into the database, then
use that user to sign into a session in the future

You can then click the logout button to exit the session. 

### Categories
each product belongs to a category and displays a category as well

selecting a category from the drop down filters the products display to only
show the selected categories
### Admin
can add/delete categories and products
only accessible by people who input the admin username and password

can see summary of all products and categories
can see list of all products
can see list of all categories