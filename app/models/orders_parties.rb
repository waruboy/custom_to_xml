class OrdersParty < ActiveRecord::Base
  belongs_to :order
  belongs_to :party
end
