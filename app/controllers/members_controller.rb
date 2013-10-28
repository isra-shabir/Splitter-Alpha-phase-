class MembersController < ApplicationController
  before_filter :authenticate_member!
  def index
  	if member_signed_in?
  		@purchases_creditor = Array.new
      @purchases_debitor = Array.new
      current_member.group_purchases.each do |purchase|
        if purchase.creatorName == current_member.email
          @purchases_creditor.push(purchase)
        else
          @purchases_debitor.push(purchase)
        end
      end
  	end
  end

  def show
    @purchases_creditor = Array.new
    @purchses_debitor = Array.new
    current_member.group_purchases.each do |purchase|
      if purchase.creatorName == current_member.email
        @purchases_creditor.push(purchase)
      else
        @purchases_debitor.push(purchase)
      end
    end
  	respond_to do |format|
  		format.html
    end
  end
end
