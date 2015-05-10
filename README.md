Custom to xml method for Order model.
====================================
to demonstrate:
1. run bundle install
2. run rake db:setup
3. run rails r lib/example.rb

files to inspect:
1. config/application.rb ; there is a line to autoload the core class extensions
2. lib/core_ext/hash.rb ; extension of the Hash class
3. lib/example.rb ; what was run in demonstration
4. db/schema.rb
5. db/seeds/rb
6. app/models/order.rb
