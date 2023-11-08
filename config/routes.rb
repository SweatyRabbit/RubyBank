# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  root 'home_pages#home'

  resource :transactions, only: %i[create]

  resource :accounts, only: %i[show]

  resource :credit_cards, only: %i[show]
end
