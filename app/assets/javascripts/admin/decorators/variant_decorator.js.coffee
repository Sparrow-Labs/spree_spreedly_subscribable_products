#= require ../shared/shared

$ ->
  planElement = $("#spreedly_subscription_plan")

  if planElement.data 'product_subscribable' == true
    featureLevel = planElement.data 'product_spreedly_feature_level'
    displaySubscriptionPlans featureLevel