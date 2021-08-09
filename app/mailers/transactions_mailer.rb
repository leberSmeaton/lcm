class TransactionsMailer < ApplicationMailer
    def new_transaction_email
        @seller = params[:seller]
        @buyer = params[:buyer]
        @product = params[:product]
        
        mail(to: @seller.email, subject: "Someone bought #{@product.product_name}!")
    end
end
