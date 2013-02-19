#= require ../shared/shared

$ ->
  $("#product_subscribable").click ->
    planElement = $('#spreedly_subscription_plan')
    featureLevelElement = $("#spreedly_feature_level_field")

    planElement.html ''
    featureLevelElement.html ''

    if $(this).is ':checked'
      $.get '/spreedly_subscription_plan/feature_levels', (data) ->
        display_feature_levels data