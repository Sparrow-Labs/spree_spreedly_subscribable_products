# This migration comes from spree_spreedly_subscribable_products (originally 20130219132535)
class AddSpreedlyFeatureLevelToProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :spreedly_feature_level, :string
  end
end
