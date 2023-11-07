# frozen_string_literal: true

class CreditCardsController < ApplicationController
  def show
    @credit_card = current_user.credit_cards.find_by(number: credit_cards_params[:number])
  end

  private

  def credit_cards_params
    params.permit(:number)
  end
end
