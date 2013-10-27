class GroupPurchase < ActiveRecord::Base
  attr_accessible :balance, :name
  has_and_belongs_to_many :members
  has_many :invoices
end
