# frozen_string_literal: true

user = User.first_or_create(email: 'example@gmail.com', password: '123123')
CreditCard.create(number: FFaker::Bank.card_number, balance: rand(10_000..100_000), user:)
