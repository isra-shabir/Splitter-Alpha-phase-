class MembersController < ApplicationController
  before_filter :authenticate_member!
  def index
  	if member_signed_in?
  		puts current_member
  	end
  end

  def show
  end
end
