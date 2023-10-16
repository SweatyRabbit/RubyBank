# frozen_string_literal: true

class Transaction < ApplicationRecord
  ONLY_DIGITS_REGEXP = /\A-?\d+\z/
  validates :amount, format: { with: ONLY_DIGITS_REGEXP }
  validate :validate_amount

  belongs_to :card

  private

  def validate_amount
    return if card.balance > amount || card.blank?

    errors.add(:amount, I18n.t('errors.bigger_than_balance'))
  end
end
