# frozen_string_literal: true

class FindRecipientCardInteractor < FindCreditCardInteractor
  def call
    find_credit_card(context.recipient_card, :recipient_card)
  end
end
