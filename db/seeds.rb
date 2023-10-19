# frozen_string_literal: true

user = FactoryBot.create(:user, email: 'example@gmail.com', password: '123123')
FactoryBot.create(:credit_card, user:)
