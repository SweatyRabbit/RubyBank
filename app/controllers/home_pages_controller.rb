# frozen_string_literal: true

class HomePagesController < ApplicationController
  def home
    @sender_cards = current_user.cards
    @recipient_cards = Card.all
  end
end
