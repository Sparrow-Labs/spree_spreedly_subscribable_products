## Spree Spreedly Subscribable Products

Adds Spreedly subscribable products and their variants to spree commerce.


## Usage

Declare your spreedly API access configuration in your environment:

```ruby
config.spreedly_api_token = 'your-api-token'
config.spreedly_site_name_short = 'your-test-site-short-name'
```

Run the installer

    $ rake spree_spreedly_subscribable_products:install
    
Run the migrations

    $ rake db:migrate

You should be good to go. Subscribable products and variants through Spreedly are configurable in the admin interface of your spree commerce store.

## Contributing

Please fork the extension and issue a pull request after you've committed your changes.

Configure your spreedly API credentials if you want to create a test application and run the integration tests. Configuration
takes place in config/spreedly_api_config.rb.
After configuring the API credentials please consider executing

```git
git update-index --assume-unchanged config/spreedly_api_config.rb
```
in order for this configuration to be ignored on contribution.

Copyright (c) 2013 Yovoslav Ivanov, released under the MIT License
