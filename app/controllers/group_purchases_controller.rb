class GroupPurchasesController < ApplicationController
  # GET /group_purchases
  # GET /group_purchases.json
  def index
    #puts params
    #@group_purchases = GroupPurchase.all
    respond_to do |format|
      format.html {redirect_to members_index_path, notice: 'Link prohibited.'}
      format.json { render json: @group_purchases }
    end
  end

  # GET /group_purchases/1
  # GET /group_purchases/1.json
  def show
    @group_purchase = GroupPurchase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group_purchase }
    end
  end

  # GET /group_purchases/new
  # GET /group_purchases/new.json
  def new
    @group_purchase = GroupPurchase.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group_purchase }
    end
  end

  # GET /group_purchases/1/edit
  def edit
    @group_purchase = GroupPurchase.find(params[:id])
  end

  # POST /group_purchases
  # POST /group_purchases.json
  def create
    @group_purchase = GroupPurchase.new(params[:group_purchase])
    @group_purchase.creatorName = current_member.email
    current_member.group_purchases << @group_purchase
    respond_to do |format|
      if @group_purchase.save
        format.html { redirect_to @group_purchase, notice: 'Group purchase was successfully created.' }
        format.json { render json: @group_purchase, status: :created, location: @group_purchase }
      else
        format.html { render action: "new" }
        format.json { render json: @group_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /group_purchases/1
  # PUT /group_purchases/1.json
  def update
    @group_purchase = GroupPurchase.find(params[:id])

    respond_to do |format|
      if @group_purchase.update_attributes(params[:group_purchase])
        format.html { redirect_to @group_purchase, notice: 'Group purchase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_purchases/1
  # DELETE /group_purchases/1.json
  def destroy
    @group_purchase = GroupPurchase.find(params[:id])
    @group_purchase.destroy
    redirect_to members_index_path

    # respond_to do |format|
    #   format.html { redirect_to members_index_path }
    #   format.json { head :no_content }
  end
end
