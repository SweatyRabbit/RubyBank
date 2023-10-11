# frozen_string_literal: true

class TransactionService
  attr_reader :amount
  attr_accessor :sender_card, :receiver_card

  def self.call(amount, sender_card, receiver_card)
    new(amount, sender_card, receiver_card).call
  end

  def initialize(amount, sender_card, receiver_card)
    @amount = amount.to_f
    @sender_card = sender_card
    @receiver_card = receiver_card
  end

  def call
    transfer_money
  end

  private

  def transfer_money
    ActiveRecord::Base.transaction do
      sender_card.update!(balance: sender_card.balance - amount)
      receiver_card.update!(balance: receiver_card.balance + amount)
    end
  end
end
