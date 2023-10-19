# frozen_string_literal: true

class TransactionsController < ApplicationController
  def create
    transaction_form = TransactionForm.new(transaction_params)

    if transaction_form.valid?
      transaction = TransferMoney.call(transaction_params)
      handle_transaction_result(transaction)
    else
      redirect_to root_path, alert: transaction_form.errors.full_messages.join('. ')
    end
  end

  private

  def transaction_params
    params.permit(:amount, :sender_card, :recipient_card)
  end

  def handle_transaction_result(transaction)
    if transaction.success?
      redirect_to root_path
    else
      redirect_to root_path, alert: transaction.error
    end
  end
end
