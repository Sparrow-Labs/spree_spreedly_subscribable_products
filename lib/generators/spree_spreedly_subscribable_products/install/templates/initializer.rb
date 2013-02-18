config = Rails.application.config

begin
  config.api_key        = config.spreedly_api_token
  config.site_name      = config.spreedly_site_name_short
rescue
  puts "Please define spreedly_api_token and spreedly_site_name_short in your environment configuration"
end