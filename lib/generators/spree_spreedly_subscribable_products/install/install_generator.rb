module SpreeSpreedlySubscribableProducts
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)
      
      def add_javascripts
        append_file 'app/assets/javascripts/store/all.js', "//= require store/spree_spreedly_subscribable_products\n"
        append_file 'app/assets/javascripts/admin/all.js', "//= require admin/spree_spreedly_subscribable_products\n"
      end

      def add_stylesheets
        inject_into_file 'app/assets/stylesheets/store/all.css', " *= require store/spree_spreedly_subscribable_products\n", :before => /\*\//, :verbose => true
        inject_into_file 'app/assets/stylesheets/admin/all.css', " *= require admin/spree_spreedly_subscribable_products\n", :before => /\*\//, :verbose => true
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_spreedly_subscribable_products'
      end

      def run_migrations
         res = ask 'Would you like to run the migrations now? [Y/n]'
         if res == '' || res.downcase == 'y'
           run 'bundle exec rake db:migrate'
         else
           puts 'Skipping rake db:migrate, don\'t forget to run it!'
         end
      end

      def add_initializer
        copy_file "initializer.rb", "config/initializers/spree_spreedly_subscribable_products.rb"
      end
    end
  end
end
