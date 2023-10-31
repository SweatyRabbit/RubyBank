# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  MIN_VALUE = 10_000
  MAX_VALUE = 100_000

  def create
    super do |resource|
      if resource.persisted?
        CreditCard.create(number: FFaker::Bank.card_number, balance: rand(MIN_VALUE..MAX_VALUE),
                          user: resource)
      end
    end
  end
end
