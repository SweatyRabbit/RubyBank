# frozen_string_literal: true

class ValidateFormInteractor < BaseInteractor
  def call
    transaction_form = TransactionForm.new(amount: context.amount,
                                           sender_card: context.sender_card,
                                           recipient_card: context.recipient_card)

    context.fail!(error: transaction_form.errors.full_messages.join('. ')) unless transaction_form.valid?

    context.amount = amount_in_cents
  end

  private

  def amount_in_cents
    (context.amount.to_f * 100).to_i
  end
end
