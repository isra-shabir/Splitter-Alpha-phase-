class MembersController < ApplicationController
  before_filter :authenticate_member!
  def index
  	if member_signed_in?
        puts current_member.email
  		 @purchases_creditor = current_member.created_group_purchases
       @invoices_debitor = current_member.invoices
  	end
  end

  def show
    @purchases_creditor = current_member.created_group_purchases
    @invoices_debitor = current_member.invoices
  	respond_to do |format|
  		format.html
    end
  end
end
