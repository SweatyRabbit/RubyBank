# frozen_string_literal: true

class TransactionsController < ApplicationController
  def create
    transaction = TransferMoney.call(transaction_params)
    if transaction.success?
      redirect_to root_path, notice: I18n.t('successful_transaction')
    else
      redirect_to root_path, alert: transaction.error
    end
  end

  private

  def transaction_params
    params.permit(:amount, :sender_card, :recipient_card)
  end
end
