#= require ../shared/shared

$ ->
  planElement = $("#spreedly_variant_subscription_plan")

  if planElement && planElement.data 'product_subscribable'
    featureLevel = planElement.data 'product_spreedly_feature_level'
    productId = planElement.data 'product_id'

    loadSubscriptionPlansForFeatureLevel productId, featureLevel, (data) ->
      planElement.html data
      planElement.addClass 'field'
      $("#product_subscription_plan_id").select2()
      $("#product_subscription_plan_id").change ->
        console.log 'plan has changed!'