Spree::CheckoutController.class_eval do
  def object_params
    binding.pry

    if @order.payment?
      if params[:payment_source].present?
        source_params = params.delete(:payment_source)[params[:order][:payments_attributes].first[:payment_method_id].underscore]

        if source_params
          params[:order][:payments_attributes].first[:source_attributes] = source_params
        end
      end

      if (params[:order][:payments_attributes])
        params[:order][:payments_attributes].first[:amount] = @order.total
      end
    end
    
    params[:order]
  end
end