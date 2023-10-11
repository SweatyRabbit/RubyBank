# frozen_string_literal: true

class StaticsController < ApplicationController
  def home
    @sender_cards = current_user.cards
    @receiver_cards = Card.all
  end
end
