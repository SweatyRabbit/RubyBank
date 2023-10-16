# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    number { FFaker::Bank.card_number }
    expiration_date { FFaker::Bank.card_expiry_date }
    cvv { FFaker::Random.rand(100..999) }
    user
  end
end
