# frozen_string_literal: true

class CreditCardsController < ApplicationController
  def show
    @credit_card = current_user.credit_cards.find_by(number: credit_cards_params[:number])

    card_not_found if @credit_card.nil?
  end

  private

  def credit_cards_params
    params.permit(:number)
  end

  def card_not_found
    flash[:danger] = I18n.t('credit_card.not_found')
    redirect_to accounts_path
  end
end
