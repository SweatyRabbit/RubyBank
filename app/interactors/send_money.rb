# frozen_string_literal: true

class SendMoney
  include Interactor

  def call
    context.sender_card.with_lock do
      context.recipient_card.with_lock do
        crete_transaction
        subtract_balance
        add_balance
      end
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
    context.sender_card.update!(balance: context.sender_card.balance - context.amount)
  end

  def add_balance
    context.recipient_card.update!(balance: context.recipient_card.balance + context.amount)
  end
end
