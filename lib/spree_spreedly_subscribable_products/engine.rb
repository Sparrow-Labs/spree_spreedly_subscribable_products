module SpreeSpreedlySubscribableProducts
  class Engine < Rails::Engine
    require 'spree/core'
    require 'coffee-rails'
    require 'sass-rails'
    isolate_namespace Spree
    engine_name 'spree_spreedly_subscribable_products'

    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
