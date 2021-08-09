class TransactionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]
  def success
      @title = params[:product_name]
  end

  def webhook
    transaction_id = params[:data][:object][:payment_intent]
    transaction = Stripe::PaymentIntent.retrieve(transaction_id)
    pp transaction
    product_id = transaction.metadata.product_id
    buyer_id = transaction.metadata.user_id
    Product.find(product_id).update(product_stock: false)
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      TransactionMailer.with(transaction: @transaction).new_transaction_email.deliver_later

      flash[:success] = "Thank you for your transaction! We'll contact you soon!"
      redirect_to root_path
    else
      flash.now[:error] = "Your transaction had some errors. Please check the form and resubmit."
      render :new
    end
  end
end
