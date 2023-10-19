# frozen_string_literal: true

class TransactionForm
  include ActiveModel::Model

  attr_accessor :amount, :sender_card, :recipient_card

  ONLY_DIGITS_REGEXP = /\A\d+(\.\d+)?\z/
  validates :sender_card, :recipient_card, presence: true
  validates :amount, format: { with: ONLY_DIGITS_REGEXP, message: I18n.t('errors.invalid_amount') },
                     numericality: { greater_than: 0 }
end
