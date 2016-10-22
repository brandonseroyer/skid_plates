class Order < ActiveRecord::Base
  belongs_to :order_status
end
