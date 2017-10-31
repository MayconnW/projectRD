# README

# User Tracking

This project provides some 'endpoints' that allows communicating with a client to track a user.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

https://github.com/MayconnW/track_js
There is a JS Library to use with this project. It is simple to use, just add the library to your project, on every page that you wish to track. There is a function in this file that shows how to send the contact to identify this user later.
Just access the link and you can see more information about how to use the library.

### Installing

With just these three steps you can run this project on your machine. 

First of all, you need the Rails environment configured on your machine. You can see here how to do that:
http://guides.rubyonrails.org/getting_started.html

After that just clone the project on your machine using this command:
git clone https://github.com/MayconnW/projectRD.git

Open the file 'config/database.yml' and put your database configuration.

Finally, you'll run these three commands:
bundle install
rake db:create db:migrate db:seed
rails s

Go to the localhost, the page will request a user and password, use:
user: adm@adm.com
password: a1s2d3f4

You could see the Users and Contacts page.

On 'Users page', you can add, edit and remove users that can access this page.

On 'Contacts page', you can see who is using the website that you are tracking, when you access it you will see all the contacts, and accessing the contact you can see which pages that user has accessed.

## Running the tests

To run the tests, you just need use this command:
bundle exec rspec spec


## Deployment

An easy way to deploy any Rails System is by using the Heroku. You can see how simple and easy is that here:
https://devcenter.heroku.com/articles/getting-started-with-rails5

## Built With

* [Ruby on Rails](http://rubyonrails.org/) - The framework used
* [RailsAdmin](https://github.com/sferik/rails_admin) - Dependency
* [Devise](https://github.com/plataformatec/devise) - Dependency

## Authors

* **Mayconn Willian** - *Initial work* - [PurpleBooth](https://github.com/mayconnw)

