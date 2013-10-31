class PaymentAccount < ActiveRecord::Base
  attr_accessible :name, :routing_number, :account_number, :country
  belongs_to :member
end
