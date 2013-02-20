#= require ../shared/shared

$ ->
  planElement = $("#spreedly_variant_subscription_plan")

  if planElement && planElement.data 'product_subscribable'
    featureLevel = planElement.data 'product_spreedly_feature_level'
    modelId = planElement.data 'variant_id'

    loadSubscriptionPlansForFeatureLevel modelId, featureLevel, 'variant', (data) ->
      planElement.html data
      planElement.addClass 'field'
      $("#variant_subscription_plan_id").change ->
        console.log "plan has changed to #{$(this).val()}!"
      $("#variant_subscription_plan_id").select2()