# frozen_string_literal: true

class FindRecipientCard
  include Interactor

  def call
    recipient_card = CreditCard.find_by(number: context.recipient_card)

    if recipient_card
      context.recipient_card = recipient_card
    else
      context.fail!(error: I18n.t('errors.no_card'))
    end
  end
end
