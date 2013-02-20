#= require ../shared/shared

displaySubscriptionPlans = (featureLevel) ->
  productId = $("#product_spreedly_feature_level").data 'product_id'
  loadSubscriptionPlansForFeatureLevel productId, featureLevel, 'product', (data) ->
    $("#product_spreedly_subscription_plan").addClass("field").html data
    $("#product_subscription_plan_id").select2()

resetProductSubscriptionOptions = ->
  $("#product_spreedly_feature_level").html ''
  $("#product_spreedly_subscription_plan").html ''

loadProductSubscriptionOptions = () ->
  productId = $("#product_spreedly_feature_level").data 'product_id'
  loadFeatureLevels productId, (data) ->
    $("#product_spreedly_feature_level").addClass("field").html data
    featureLevelSelect = $("#spreedly_feature_level")
    featureLevelSelect.select2()
    featureLevel = featureLevelSelect.val()
    displaySubscriptionPlans featureLevel

    $("#spreedly_feature_level").change ->
      featureLevel = $(this).val()
      displaySubscriptionPlans featureLevel

$ ->
  if $("#product_subscribable").is ':checked'
    loadProductSubscriptionOptions()

  $("#product_subscribable").change ->
    if $(this).is ':checked'
      loadProductSubscriptionOptions()
    else
      resetProductSubscriptionOptions()