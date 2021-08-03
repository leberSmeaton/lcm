class RemoveTransactionDateFromTransactions < ActiveRecord::Migration[6.0]
  def change
    remove_column :transactions, :transaction_date, :datetime
  end
end
