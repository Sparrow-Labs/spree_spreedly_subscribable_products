require 'rspreedly'

class SpreedlySubscriptionPlanController < ApplicationController
  def index
    render partial: 'subscription_plan/partials/spreedly_subscription_plans', locals: {
      subscription_plans: plans_for_product(params[:product_name])
    }
  end

  private

  def plans_for_product(product_name)
    subscription_plans = RSpreedly::SubscriptionPlan.find :all

    subscription_plans.find_all do |plan|
      plan.feature_level == product_name.downcase
    end
  end
end
