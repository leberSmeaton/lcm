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
    user_id = transaction.metadata.user_id
    
    @product = Product.find(product_id)
    @product.update(product_stock: false)
    
    @seller = User.find(@product.user_id)
    @buyer = User.find(user_id)

    @transaction = Transaction.create(product_id: product_id, user_id: user_id)
    TransactionsMailer.with(seller: @seller, product: @product, buyer: @buyer).new_transaction_email.deliver_later
  end
end
