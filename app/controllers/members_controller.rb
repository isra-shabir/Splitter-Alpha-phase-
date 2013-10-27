class MembersController < ApplicationController
  before_filter :authenticate_member!
  def index
  	if member_signed_in?
  		puts current_member
      respond_to do |format|
        format.html
      end
  	end
  end

  def show
  	respond_to do |format|
  		format.html
    end
  end
end
