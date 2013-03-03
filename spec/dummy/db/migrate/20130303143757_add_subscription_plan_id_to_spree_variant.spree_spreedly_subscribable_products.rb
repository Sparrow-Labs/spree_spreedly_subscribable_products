# This migration comes from spree_spreedly_subscribable_products (originally 20130219170221)
class AddSubscriptionPlanIdToSpreeVariant < ActiveRecord::Migration
  def change
    add_column :spree_variants, :subscription_plan_id, :integer
  end
end
