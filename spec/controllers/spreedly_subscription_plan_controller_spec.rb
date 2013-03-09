require 'spec_helper'
require 'spree/core/testing_support/factories'

def any_feature_level
  RSpreedly::SubscriptionPlan.all.first.feature_level
end

def any_subscription_plan
  RSpreedly::SubscriptionPlan.all.first
end

describe SpreedlySubscriptionPlanController do

  describe "GET 'index'" do
    product = FactoryGirl.create :product

    it "returns http success" do
      get 'index', {
        model_name: 'product',
        model_id: product.id,
        feature_level: any_feature_level,
        use_route: :spree
      }

      response.should be_success
      product.delete
    end
  end

  describe "GET 'show'" do
    it 'returns http success' do
      get 'show', {
        use_route: :spree,
        plan_id: any_subscription_plan.id
      }

      response.should be_success
    end
  end

  describe "GET 'feature_levels'" do
    product = FactoryGirl.create :product

    it 'returns http success' do
      get 'feature_levels', {
        use_route: :spree,
        product_id: product.id
      }

      response.should be_success
      product.delete
    end
  end
end
