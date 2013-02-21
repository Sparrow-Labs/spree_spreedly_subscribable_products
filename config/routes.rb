Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  get "spreedly_subscription_plan/index"
  get "spreedly_subscription_plan/feature_levels"
  get "spreedly_subscription_plan/show"
end
