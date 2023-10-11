# frozen_string_literal: true

FactoryBot.create_list(:user, 5).each do |user|
  FactoryBot.create_list(:card, 10, user:)
end
