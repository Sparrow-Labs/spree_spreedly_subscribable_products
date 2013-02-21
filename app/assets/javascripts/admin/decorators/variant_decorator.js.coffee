#= require ../shared/shared

updateVariantPrice = (subscriptionPlanId) ->
  loadSubscriptionPlanWithId subscriptionPlanId, (data) ->
    variantPriceInput = $("#variant_price")
    variantPriceInput.val data['price']
    variantPriceInput.attr 'readonly', 'readonly'

$ ->
  planElement = $("#spreedly_variant_subscription_plan")

  if planElement && planElement.data 'product_subscribable'
    featureLevel = planElement.data 'product_spreedly_feature_level'
    modelId = planElement.data 'variant_id'

    loadSubscriptionPlansForFeatureLevel modelId, featureLevel, 'variant', (data) ->
      planElement.html data
      planElement.addClass 'field'
      subscriptionPlanSelect = $("#variant_subscription_plan_id")
      updateVariantPrice subscriptionPlanSelect.val()
      subscriptionPlanSelect.change ->
        updateVariantPrice $(this).val()

      subscriptionPlanSelect.select2()