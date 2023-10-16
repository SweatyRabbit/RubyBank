# frozen_string_literal: true

class CardDecorator < ApplicationDecorator
  delegate_all

  def formatted_balance
    "$#{balance / 100.0}"
  end
end
