# frozen_string_literal: true

class TransactionsController < ApplicationController
  def create
    sender_card = find_sender_card
    receiver_card = find_receiver_card
    transaction = create_transaction(sender_card, receiver_card)

    handle_transaction_result(transaction)
  end

  private

  def transaction_params
    params.permit(:amount, :sender_card, :receiver_card)
  end

  def find_sender_card
    current_user.cards.find_by(number: transaction_params[:sender_card])
  end

  def find_receiver_card
    Card.find_by(number: transaction_params[:receiver_card])
  end

  def create_transaction(sender_card, receiver_card)
    TransferMoney.call(amount: transaction_params[:amount], sender_card:, receiver_card:)
  end

  def handle_transaction_result(transaction)
    if transaction.success?
      redirect_to root_path
    else
      redirect_to root_path, alert: transaction.error
    end
  end
end
