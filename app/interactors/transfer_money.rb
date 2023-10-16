# frozen_string_literal: true

class TransferMoney
  include Interactor

  def call
    ActiveRecord::Base.transaction do
      subtract_balance
      add_balance
    end
  rescue ActiveRecord::RecordInvalid => e
    context.fail!(error: e.record.errors.full_messages.join('. '))
  end

  private

  def subtract_balance
    context.sender_card.transactions.create!(sender_card: context.sender_card.number,
                                             recipient_card: context.recipient_card.number,
                                             amount: -amount)
  end

  def add_balance
    context.recipient_card.transactions.create!(sender_card: context.sender_card.number,
                                                recipient_card: context.recipient_card.number,
                                                amount:)
  end

  def amount
    (context.amount.to_f * 100).to_i
  end
end
