# frozen_string_literal: true

class TransactionsController < ApplicationController
  def create
    sender_card = current_user.cards.find_by(number: transaction_params[:sender_card])
    receiver_card = Card.find_by(number: transaction_params[:receiver_card])
    transaction = TransactionService.call(transaction_params[:amount], sender_card, receiver_card)
    if transaction.success
      redirect_to root_path
    else
      render json: transaction.errors, status: :unprocessable_entity
    end
  end

  private

  def transaction_params
    params.permit(:amount, :sender_card, :receiver_card)
  end
end
