# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    amount { Random.rand(1000..100_000) }
    sender_card factory: %i[credit_card]
    recipient_card factory: %i[credit_card]
  end
end
