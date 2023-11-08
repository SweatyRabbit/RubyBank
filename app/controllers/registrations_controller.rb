# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      if resource.persisted?
        begin
          CreditCard.create!(number: FFaker::Bank.card_number, balance: CreditCard::MIN_VALUE,
                             user: resource)
        rescue ActiveRecord::RecordNotUnique
          retry
        end
      end
    end
  end
end
