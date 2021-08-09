class TransactionsMailer < ApplicationMailer
    def new_transaction_email
        @transaction = params[:transaction]
        
        mail(to: gcam012113@coderacademy.edu.au, subject: "You got a new transaction!")
    end
end
