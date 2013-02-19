class AddSpreedlyFeatureLevelToProducts < ActiveRecord::Migration
  def change
    add_column :products, :spreedly_feature_level, :string
  end
end
