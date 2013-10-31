class PaymentAccountsController < ApplicationController


  def new
    @payment_account = PaymentAccount.new
  end

  def create
    @payment_account = PaymentAccount.new(params[:payment_account])
    @payment_account.member = current_member
    @payment_account.deposit_token = create_recipient_account
    @payment_account.charge_token  = params[:charge_token]
    respond_to do |format|
      if @payment_account.save
        format.html { redirect_to action: "edit", notice: 'Pay account was successfully created.' }
        format.json { render json: @payment_account, status: :created, location: @payment_account }
      else
        format.html { render action: "new" }
        format.json { render json: @payment_account.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    render text: "no view yet"
  end

  def edit
    @payment_account = PaymentAccount.find(params[:id])
  end

  def update
  end

  def destroy
  end


  def transfer

    invoice           = Invoice.find(params[:invoice_id])
    amount            = invoice.balance
    recipient         = invoice.group_purchase.creditor
    description       = invoice.group_purchase.purchaseName

    transfer = Stripe::Transfer.create(
      :amount => "200", # amount in cents
      :currency => "usd",
      :recipient => recipient.payment_account.deposit_token,
      :statement_descriptor => "should have invoice detail"
    )

    invoice.paid = true
    invoice.save

    redirect_to :root, notice: 'Payment successfull.'

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to :root
  end

  private

    def create_recipient_account
      user_as_recipient = Stripe::Recipient.create(
                            :name => params[:payment_account][:name],
                            :type => "individual",
                            :email => current_member.email,
                            :bank_account => {
                                  :country => params[:payment_account][:country],
                                  :routing_number => params[:payment_account][:routing_number],
                                  :account_number => params[:payment_account][:account_number]
                            }
                          )
      user_as_recipient.id
    end
end
