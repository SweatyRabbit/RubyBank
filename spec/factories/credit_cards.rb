# frozen_string_literal: true

FactoryBot.define do
  factory :credit_card do
    number { FFaker::Bank.card_number }
    balance { rand(10_000..100_000) }
    user
  end
end
