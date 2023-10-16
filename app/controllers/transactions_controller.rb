# frozen_string_literal: true

class TransactionsController < ApplicationController
  def create
    sender_card = find_sender_card
    recipient_card = find_recipient_card
    return redirect_to root_path, alert: I18n.t('errors.no_card') if sender_card.nil? || recipient_card.nil?

    return redirect_to root_path, alert: I18n.t('errors.invalid_transfer') if sender_card == recipient_card

    transaction = create_transaction(sender_card, recipient_card)

    handle_transaction_result(transaction)
  end

  private

  def transaction_params
    params.permit(:amount, :sender_card, :recipient_card)
  end

  def find_sender_card
    current_user.cards.find_by(number: transaction_params[:sender_card])
  end

  def find_recipient_card
    Card.find_by(number: transaction_params[:recipient_card])
  end

  def create_transaction(sender_card, recipient_card)
    TransferMoney.call(amount: transaction_params[:amount], sender_card:, recipient_card:)
  end

  def handle_transaction_result(transaction)
    if transaction.success?
      redirect_to root_path
    else
      redirect_to root_path, alert: transaction.error
    end
  end
end
