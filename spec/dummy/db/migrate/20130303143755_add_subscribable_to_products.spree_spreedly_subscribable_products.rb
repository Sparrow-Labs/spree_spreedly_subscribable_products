# This migration comes from spree_spreedly_subscribable_products (originally 20130218213839)
class AddSubscribableToProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :subscribable, :bool
  end
end
