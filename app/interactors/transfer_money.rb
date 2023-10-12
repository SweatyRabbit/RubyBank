# frozen_string_literal: true

class TransferMoney
  include Interactor

  def call
    ActiveRecord::Base.transaction do
      subtract_balance
      add_balance
    rescue StandardError => e
      context.fail!(error: e.message)
    end
  end

  private

  def subtract_balance
    context.sender_card.update!(balance: context.sender_card.balance - context.amount.to_f)
  end

  def add_balance
    context.receiver_card.update!(balance: context.receiver_card.balance + context.amount.to_f)
  end
end
