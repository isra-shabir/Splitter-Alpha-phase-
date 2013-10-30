class Invoice < ActiveRecord::Base
  attr_accessible :balance, :debtor
  belongs_to :group_purchase
  belongs_to :debtor, :class_name=> "Member"
end
