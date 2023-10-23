# frozen_string_literal: true

class SendMoney
  include Interactor

  def call
    ActiveRecord::Base.transaction do
      crete_transaction
      subtract_balance
      add_balance
    end
  rescue ActiveRecord::RecordInvalid, ActiveRecord::StaleObjectError => e
    context.fail!(error: e.record.errors.full_messages.join('. '))
  end

  private

  def crete_transaction
    Transaction.create!(sender_card: context.sender_card,
                        recipient_card: context.recipient_card,
                        amount: context.amount)
  end

  def subtract_balance
    context.sender_card.lock!.update!(balance: context.sender_card.balance - context.amount)
  end

  def add_balance
    context.recipient_card.lock!.update!(balance: context.recipient_card.balance + context.amount)
  end
end
