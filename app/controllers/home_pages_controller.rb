# frozen_string_literal: true

class HomePagesController < ApplicationController
  def home
    @sender_cards = current_user.credit_cards
    @recipient_cards = CreditCard.all
  end
end
