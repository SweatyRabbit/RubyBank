# frozen_string_literal: true

emails = %w[example@gmail.com example1@gmail.com].freeze

emails.each do |email|
  User.find_or_create_by!(email:) do |user|
    user.password = '123123'
    user.confirmed_at = Time.zone.now
    CreditCard.create!(number: FFaker::Bank.card_number, balance: 100_000, user:)
  end
end
