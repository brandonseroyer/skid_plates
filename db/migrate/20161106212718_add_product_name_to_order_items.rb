class AddProductNameToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :product_name, :string
  end
end
