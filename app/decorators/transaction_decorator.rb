# frozen_string_literal: true

class TransactionDecorator < ApplicationDecorator
  delegate_all

  def formatted_amount
    "#{amount / 100.0}$"
  end
end
