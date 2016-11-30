class AddCartToOrdersTable < ActiveRecord::Migration
  def change
    add_column :orders, :cart, :string
  end
end
