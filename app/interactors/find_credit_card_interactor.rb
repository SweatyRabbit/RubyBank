# frozen_string_literal: true

class FindCreditCardInteractor < BaseInteractor
  private

  def find_credit_card(number, card_type)
    credit_card = CreditCard.find_by(number:)

    if credit_card
      context[card_type] = credit_card
    else
      context.fail!(error: I18n.t('errors.no_card'))
    end
  end
end
