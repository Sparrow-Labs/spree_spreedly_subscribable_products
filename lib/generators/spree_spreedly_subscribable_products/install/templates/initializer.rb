require 'rspreedly'

config = Rails.application.config

begin
  RSpreedly::Config.api_key        = config.spreedly_api_token
  RSpreedly::Config.site_name      = config.spreedly_site_name_short
rescue
  puts "Please define spreedly_api_token and spreedly_site_name_short in your environment configuration"
end