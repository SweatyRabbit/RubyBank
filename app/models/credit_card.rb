# frozen_string_literal: true

class CreditCard < ApplicationRecord
  MIN_VALUE = 0.0

  validates :number, presence: true, uniqueness: true
  validates :balance, numericality: { greater_than_or_equal_to: MIN_VALUE }

  belongs_to :user
  has_many :sent_transactions, class_name: 'Transaction', foreign_key: 'sender_card_id',
                               inverse_of: :sender_card, dependent: :destroy
  has_many :received_transactions, class_name: 'Transaction', foreign_key: 'recipient_card_id',
                                   inverse_of: :recipient_card, dependent: :destroy
end
