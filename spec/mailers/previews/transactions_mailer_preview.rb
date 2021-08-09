# Preview all emails at http://localhost:3000/rails/mailers/transactions_mailer
class TransactionsMailerPreview < ActionMailer::Preview
  def new_transaction_email
    # Set up a temporary order for the preview
    transaction = Transaction.new(name: "Joe Smith", email: "joe@gmail.com", address: "1-2-3 Chuo, Tokyo, 333-0000", phone: "090-7777-8888", message: "I want to place an order!")

    TransactionMailer.with(transaction: transaction).new_transaction_email
  end
end
