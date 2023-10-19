# frozen_string_literal: true

class Transaction < ApplicationRecord
  validate :validate_amount
  validate :validate_card

  belongs_to :sender_card, class_name: 'CreditCard', inverse_of: :sent_transactions
  belongs_to :recipient_card, class_name: 'CreditCard', inverse_of: :received_transactions

  private

  def validate_amount
    return if sender_card.balance > amount

    errors.add(:amount, I18n.t('errors.bigger_than_balance'))
  end

  def validate_card
    return if sender_card.present? && recipient_card.present?

    errors.add(:card, I18n.t('errors.no_card'))
  end
end
