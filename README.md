SpreePurchaseOrder
==================
This is a Spree extension that allows customer to checkout with a purchase order as the payment method.

Installation
------------

Add this line to your gemfile:

    $ gem 'spree_purchase_order', :git => 'git://github.com/MettaAudio/spree_purchase_order.git', :branch => 'master'

The following terminal commands will copy the migration files to the corresponding directory in your Rails application and apply the migrations to your database.

    $ bundle exec rails g spree_purchase_order:install
    $ bundle exec rake db:migrate

Then set any preferences.


Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test_app
    $ bundle exec rspec spec

Copyright (c) 2013 Thumb Tack Software, LLC., released under the New BSD License
