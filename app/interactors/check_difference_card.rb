# frozen_string_literal: true

class CheckDifferenceCard
  include Interactor

  def call
    context.fail!(error: I18n.t('errors.invalid_transfer')) if context.sender_card == context.recipient_card
  end
end
