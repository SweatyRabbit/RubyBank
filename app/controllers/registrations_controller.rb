# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  MIN_VALUE = 0

  def create
    super do |resource|
      if resource.persisted?
        CreditCard.create(number: FFaker::Bank.card_number, balance: MIN_VALUE,
                          user: resource)
      end
    end
  end
end
