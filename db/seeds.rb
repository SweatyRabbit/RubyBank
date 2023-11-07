# frozen_string_literal: true

user = User.first_or_create(email: 'example@gmail.com', password: '123123', confirmed_at: Time.zone.now)
CreditCard.create(number: FFaker::Bank.card_number, balance: 100_000, user:)

user1 = User.first_or_create(email: 'example2@gmail.com', password: '123123', confirmed_at: Time.zone.now)
CreditCard.create(number: FFaker::Bank.card_number, balance: 100_000, user: user1)
