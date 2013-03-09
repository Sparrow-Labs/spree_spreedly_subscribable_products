require 'spec_helper'
require 'spree/core/testing_support/factories'

def setup_products_and_feature_levels
  
end

describe SpreedlySubscriptionPlanController do

  describe "GET 'index'" do
    setup_products_and_feature_levels

    it "returns http success" do
      get 'index', use_route: :spree
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it 'returns http success' do
      get 'show', use_route: :spree
      response.should be_success
    end
  end

  describe "GET 'feature_levels'" do
    it 'returns http success' do
      get 'feature_levels', use_route: :spree
      response.should be_success
    end
  end
end
