FactoryGirl.define do
  factory :spreedly_payment_method, class: Spree::Gateway::Spreedly do
    name 'Spreedly Subscription Services Gateway'
    environment 'test'
  end  
end