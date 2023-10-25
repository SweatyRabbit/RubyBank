# frozen_string_literal: true

class FindRecipientCardInteractor < BaseInteractor
  def call
    find_credit_card(context.recipient_card, :recipient_card)
  end
end
