//= require admin/spree_core
$ ->
  $("#product_subscribable").click ->
    $('#subscription_plans').html ' '
    
    if $(this).is ':checked'
      product_name = $('#product_name').val()
      $.get "/spreedly_subscription_plan/index?product_name=#{product_name}", (data) ->
        $('#subscription_plans').html data
        $("#product_subscription_plan_id").select2()
