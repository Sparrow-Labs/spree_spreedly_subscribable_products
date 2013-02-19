class AddSpreedlyFeatureLevelToProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :spreedly_feature_level, :string
  end
end
