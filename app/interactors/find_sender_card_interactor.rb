# frozen_string_literal: true

class FindSenderCardInteractor < BaseInteractor
  def call
    find_credit_card(context.sender_card, :sender_card)
  end
end
