# frozen_string_literal: true

class TransactionsController < ApplicationController
  def create
    transaction = TransferMoneyOrganizer.call(transaction_params)
    if transaction.success?
      flash[:success] = I18n.t('successful_transaction')
    else
      flash[:danger] = transaction.error
    end
    redirect_to root_path
  end

  private

  def transaction_params
    params.permit(:amount, :sender_card, :recipient_card)
  end
end
