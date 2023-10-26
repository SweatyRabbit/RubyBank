# frozen_string_literal: true

class FindSenderCardInteractor < FindCreditCardInteractor
  def call
    find_credit_card(context.sender_card, :sender_card)
  end
end
