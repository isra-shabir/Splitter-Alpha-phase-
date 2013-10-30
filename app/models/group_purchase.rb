class GroupPurchase < ActiveRecord::Base
  attr_accessible :balance, :purchaseName, :creatorName

  has_many :invoices
  has_many :debtors, :through=> :invoices, :class_name=>"Member"
  belongs_to :creditor , :class_name=>"Member"

end
