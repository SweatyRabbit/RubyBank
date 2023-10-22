# frozen_string_literal: true

class TransactionForm
  include ActiveModel::Model

  attr_accessor :amount, :sender_card, :recipient_card

  validates :sender_card, :recipient_card, presence: true
  validates :amount, numericality: { greater_than: 0, message: I18n.t('errors.invalid_amount') }
end
