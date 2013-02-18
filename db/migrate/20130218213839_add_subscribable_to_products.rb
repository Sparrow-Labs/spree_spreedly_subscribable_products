class AddSubscribableToProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :subscribable, :bool
  end
end
