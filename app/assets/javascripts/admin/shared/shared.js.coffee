@display_feature_levels = (data) ->
  $("#spreedly_feature_level_field").addClass("field").html data
  $("#spreedly_feature_level").change ->
    display_subscription_plans()
  $("#spreedly_feature_level").select2()

@display_subscription_plans = () ->
  feature_level = $('#spreedly_feature_level').val()
  $.get "/spreedly_subscription_plan/index?feature_level=#{feature_level}", (data) ->
    $('#spreedly_subscription_plan').addClass("field").html data
    $("#product_subscription_plan_id").select2()