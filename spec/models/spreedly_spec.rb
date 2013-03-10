require 'spec_helper'
require 'active_merchant'
require 'spree/core/testing_support/factories'
require './spec/factories/spreedly_gateway_factory'

def any_subscription_plan
  RSpreedly::SubscriptionPlan.all.first
end

describe Spree::Gateway::Spreedly do

  context 'spreedly subscription services' do
    before :each do
      @spreedly_gateway = FactoryGirl.create :spreedly_payment_method

      @payment = FactoryGirl.build :payment
      @payment.payment_method = @spreedly_gateway

      @valid_test_visa = ActiveMerchant::Billing::CreditCard.new(
        :first_name => 'Steve',
        :last_name  => 'Smith',
        :month      => '9',
        :year       => '2010',
        :brand      => 'visa',
        :number     => '4111111111111111'
      )

      @invalid_test_visa = ActiveMerchant::Billing::CreditCard.new(
        :first_name => 'Steve',
        :last_name  => 'Smath',
        :month      => '9',
        :year       => '2010',
        :brand      => 'visa',
        :number     => '411111111111111'
      )
    end
  
    it 'purchases successfully with a valid test credit card' do
      @payment.attributes = @valid_test_visa
      @payment.save!

      @payment.should_receive(:complete!)
      @payment.process!
    end

    it 'purchases unsuccessfully with a invalid credit card' do
      @payment.attributes = @invalid_test_visa
      @payment.save!

      @payment.should_receive(:failure)
      @payment.process!
    end

    after :each do
      @spreedly_gateway.delete
      @payment.delete
    end
  end
end
