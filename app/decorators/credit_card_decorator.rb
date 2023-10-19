# frozen_string_literal: true

class CreditCardDecorator < ApplicationDecorator
  delegate_all

  def formatted_balance
    "$#{balance / 100.0}"
  end
end
