# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'home_pages#home'

  resource :transactions, only: %i[create]

  resource :accounts, only: %i[show]
end
