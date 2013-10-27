class GroupPurchase < ActiveRecord::Base
  attr_accessible :balance, :purchaseName, :creatorName
  has_and_belongs_to_many :members
  has_many :invoices
end
