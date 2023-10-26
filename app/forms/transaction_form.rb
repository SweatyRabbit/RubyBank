# frozen_string_literal: true

class TransactionForm < BaseForm
  attr_accessor :amount, :sender_card, :recipient_card

  validates :sender_card, :recipient_card, presence: true
  validates :amount, numericality: { greater_than: 0, message: I18n.t('errors.invalid_amount') }
  validate :difference_credit_cards

  private

  def difference_credit_cards
    errors.add(:base, I18n.t('errors.invalid_transfer')) if sender_card == recipient_card
  end
end
