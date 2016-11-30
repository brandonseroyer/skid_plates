class AddTrackingNumberToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :tracking_number, :integer
  end
end
