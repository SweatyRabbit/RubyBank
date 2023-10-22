# frozen_string_literal: true

class ValidateForm
  include Interactor

  def call
    transaction_form = TransactionForm.new(amount: context.amount,
                                           sender_card: context.sender_card,
                                           recipient_card: context.recipient_card)

    context.fail!(error: transaction_form.errors.full_messages.join('. ')) unless transaction_form.valid?

    context.amount = amount
  end

  private

  def amount
    (context.amount.to_f * 100).to_i
  end
end
