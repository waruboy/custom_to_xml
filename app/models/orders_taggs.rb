class OrdersTaggs < ActiveRecord::Base
  belongs_to :order
  belongs_to :tagg
end
