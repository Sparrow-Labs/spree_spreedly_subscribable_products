@displayFeatureLevels = (data) ->
  $("#spreedly_feature_level_field").addClass("field").html data
  $("#spreedly_feature_level").change ->
    featureLevel = $(this).val()
    displaySubscriptionPlans featureLevel
  $("#spreedly_feature_level").select2()

@displaySubscriptionPlans = (featureLevel) ->
  $.get "/spreedly_subscription_plan/index?feature_level=#{featureLevel}", (data) ->
    $('#spreedly_subscription_plan').addClass("field").html data
    $("#product_subscription_plan_id").select2()