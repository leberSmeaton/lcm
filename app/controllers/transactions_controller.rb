class TransactionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]
  def success
      @title = params[:product_name]
  end

  def webhook
    pp params
  end
end
