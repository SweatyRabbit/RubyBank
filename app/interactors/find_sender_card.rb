# frozen_string_literal: true

class FindSenderCard
  include Interactor

  def call
    sender_card = CreditCard.find_by(number: context.sender_card)

    if sender_card
      context.sender_card = sender_card
    else
      context.fail!(error: I18n.t('errors.no_card'))
    end
  end
end
