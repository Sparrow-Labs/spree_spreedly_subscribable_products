@loadFeatureLevels = (productId, completionHandler) ->
  $.get "/spreedly_subscription_plan/feature_levels?product_id=#{productId}", (data) ->
    completionHandler data

@loadSubscriptionPlansForFeatureLevel = (modelId, featureLevel, modelName, completionHandler) ->
  $.get "/spreedly_subscription_plan/index?model_id=#{modelId}&feature_level=#{featureLevel}&model_name=#{modelName}", (data) ->
    completionHandler data