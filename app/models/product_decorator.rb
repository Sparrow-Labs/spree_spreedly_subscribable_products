Spree::Product.class_eval do
  attr_accessible :subscribable, :spreedly_feature_level, :subscription_plan_id
end