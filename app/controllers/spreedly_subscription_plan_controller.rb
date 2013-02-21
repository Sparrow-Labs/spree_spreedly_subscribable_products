require 'rspreedly'

class SpreedlySubscriptionPlanController < ApplicationController
  def index
    model_name = params[:model_name].capitalize

    render partial: 'subscription_plan/partials/spreedly_subscription_plans', locals: {
      model_name: params[:model_name],
      clazz: "Spree::#{model_name}".constantize.find(params[:model_id]),
      subscription_plans: plans_for_feature_level(params[:feature_level])
    }
  end

  def show
    render json: subscription_plan_with_id(params[:plan_id])
  end

  def feature_levels
    render partial: 'subscription_plan/partials/spreedly_feature_levels', locals: {
      product: Spree::Product.find(params[:product_id]),
      feature_levels: uniq_spreedly_feature_levels
    }
  end

private
    
  def plans_for_feature_level(feature_level)
    subscription_plans.find_all do |plan|
      plan.feature_level == feature_level.downcase
    end
  end

  def uniq_spreedly_feature_levels
    levels = []

    subscription_plans.each do |plan|
      levels << plan.feature_level
    end

    levels.uniq
  end

  def subscription_plans
    RSpreedly::SubscriptionPlan.find :all
  end

  def subscription_plan_with_id(plan_id)
    RSpreedly::SubscriptionPlan.find plan_id
  end
end