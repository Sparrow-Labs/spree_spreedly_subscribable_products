Spree::Product.class_eval do
  attr_accessible :subscribable, :subscription_plan
end