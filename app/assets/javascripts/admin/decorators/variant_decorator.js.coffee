#= require ../shared/shared

$ ->
  planElement = $("#spreedly_variant_subscription_plan")

  if planElement && planElement.data 'product_subscribable'
    featureLevel = planElement.data 'product_spreedly_feature_level'
    displaySubscriptionPlans featureLevel