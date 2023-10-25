# frozen_string_literal: true

class TransferMoneyInteractor < BaseInteractor
  include Interactor::Organizer

  organize ValidateFormInteractor, FindSenderCardInteractor, FindRecipientCardInteractor, SendMoneyInteractor
end
