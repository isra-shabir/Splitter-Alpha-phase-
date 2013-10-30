class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  has_many :invoices, :foreign_key=>"debtor_id"
  has_many :group_purchases, :through=> :invoices
  has_many :created_group_purchases, :class_name=>"GroupPurchase", :foreign_key=> "creditor_id"
  
  def self.search(search)
    if search
      where('email LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
