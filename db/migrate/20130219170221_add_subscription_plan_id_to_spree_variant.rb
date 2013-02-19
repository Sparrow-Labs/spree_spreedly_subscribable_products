class AddSubscriptionPlanIdToSpreeVariant < ActiveRecord::Migration
  def change
    add_column :spree_variants, :subscription_plan_id, :integer
  end
end
