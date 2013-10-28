class InvoicesController < ApplicationController
  # GET /invoices
  # GET /invoices.json
  def index
    #@invoices = Invoice.all

    respond_to do |format|
      format.html {redirect_to members_index, notice: 'Link prohibited.'}
      format.json { render json: @invoices }
    end
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @invoice = Invoice.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invoice }
    end
  end

  # GET /invoices/new
  # GET /invoices/new.json
  def new
    @group_purchase = params[:group_purchase_id]
    @invoice = Invoice.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invoice }
    end
  end

  # GET /invoices/1/edit
  def edit
    @invoice = Invoice.find(params[:id])
  end

  # POST /invoices
  # POST /invoices.json
  def create    
    @group_purchase = GroupPurchase.find(params[:group_purchase_id])
    @group_purchase.members << Member.where(email: params[:invoice][:debtor]).first
    @invoice = Invoice.new(params[:invoice])
    @invoice.group_purchase = @group_purchase
    num_members = @group_purchase.members.length
    @invoice.balance = @invoice.group_purchase.balance/num_members
    respond_to do |format|
      if @invoice.save
        format.html { redirect_to group_purchase_path(@group_purchase), notice: 'Invoice was successfully created.' }
        format.json { render json: @invoice, status: :created, location: @invoice }
      else
        format.html { render action: "new", notice: 'An error occurred.' }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invoices/1
  # PUT /invoices/1.json
  def update
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_url }
      format.json { head :no_content }
    end
  end
end
