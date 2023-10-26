# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      FactoryBot.create(:credit_card, user: resource) if resource.persisted?
    end
  end
end
