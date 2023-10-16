# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    card
    amount { Random.rand(1000..100_000) }
    sender_card { card.number }
    recipient_card { FFaker::Bank.card_number }
  end
end
