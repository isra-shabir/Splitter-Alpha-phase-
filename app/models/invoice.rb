class Invoice < ActiveRecord::Base
  attr_accessible :balance, :debtor
  belongs_to :group_purchase
end
