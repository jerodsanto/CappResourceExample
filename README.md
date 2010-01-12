# CappResourceExample #

This is a little [Cappuccino](http://github.com/280north/cappuccino) application built to demonstrate usage of [CappuccinoResource](http://github.com/sant0sk1/CappuccinoResource), a library which helps you put Cappuccino on Rails.

The app is a (very basic) clone of OS X's Address Book. If you just want to try it out, there is [a working demo](http://capp-resource-example.heroku.com) on Heroku.

## Installation ##

If you want to play with the source in a local environment, follow these steps:

Install Rails 2.3.5:

`gem install rails -v=2.3.5`

Clone this repository:

`git clone http://github.com/sant0sk1/CappResourceExample`

Install required gems (just Faker):

`rake gems:install`

Migrate and seed the database:

`rake db:migrate && rake db:seed`

That's all there is to it. Now you can script/server or setup a Passenger config or whatever. The Cappuccino application is in /capp.

Enjoy!
