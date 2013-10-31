class Invoice < ActiveRecord::Base
  attr_accessible :balance, :debtor, :paid
  belongs_to :group_purchase
  belongs_to :debtor, :class_name=> "Member"

  def paid?
    self.paid
  end
end
