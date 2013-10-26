class GroupPurchase < ActiveRecord::Base
  attr_accessible :balance, :name
  has_and_belongs_to_many :members
end
