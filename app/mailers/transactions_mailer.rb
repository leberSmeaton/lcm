class TransactionsMailer < ApplicationMailer
    def new_transaction_email
        @seller = params[:seller]
        @buyer = params[:buyer]
        @product = params[:product]
        
        mail(to: "gcam012113@coderacademy.edu.au", subject: "Someone bought #{@product.product_name}!")
    end
end
