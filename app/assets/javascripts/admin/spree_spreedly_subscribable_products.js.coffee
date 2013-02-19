//= require admin/spree_core
$ ->
  $("#product_subscribable").click ->
    planElement = $('#spreedly_subscription_plan')
    featureLevelElement = $("#spreedly_feature_level")

    planElement.html ''
    featureLevelElement.html ''

    if $(this).is ':checked'
      $.get '/spreedly_subscription_plan/feature_levels', (data) ->
        featureLevelElement.addClass("field").html data
        $("#spreedly_feature_level_id").on "change", ->
          display_subscription_plans()
        $("#spreedly_feature_level_id").select2()

display_subscription_plans = () ->
  feature_level = $('#spreedly_feature_level_id').val()
  $.get "/spreedly_subscription_plan/index?feature_level=#{feature_level}", (data) ->
    $('#spreedly_subscription_plan').addClass("field").html data
    $("#product_subscription_plan_id").select2()
