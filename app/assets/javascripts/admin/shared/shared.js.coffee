@loadFeatureLevels = (productId, completionHandler) ->
  $.get "/spreedly_subscription_plan/feature_levels?product_id=#{productId}", (data) ->
    completionHandler data

@loadSubscriptionPlansForFeatureLevel = (productId, featureLevel, completionHandler) ->
  $.get "/spreedly_subscription_plan/index?product_id=#{productId}&feature_level=#{featureLevel}", (data) ->
    completionHandler data