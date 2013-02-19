//= require admin/spree_core
$ ->
  $("#product_subscribable").click ->
    $('#subscription_plans').html ' '
    $("#spreedly_feature_level").html ' '

    if $(this).is ':checked'
      $.get '/spreedly_subscription_plan/feature_levels', (data) ->
        $("#spreedly_feature_level").addClass("field").html data
        $("#spreedly_feature_level_id").on "change", ->
          console.log "Fuck off!"
          display_subscription_plans()
        $("#spreedly_feature_level_id").select2()

display_subscription_plans = () ->
  feature_level = $('#spreedly_feature_level_id').val()
  $.get "/spreedly_subscription_plan/index?feature_level=#{feature_level}", (data) ->
    $('#subscription_plans').addClass("field").html data
    $("#product_subscription_plan_id").select2()
