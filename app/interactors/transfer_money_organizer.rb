# frozen_string_literal: true

class TransferMoneyOrganizer < BaseOrganizer
  organize ValidateFormInteractor, FindSenderCardInteractor, FindRecipientCardInteractor, SendMoneyInteractor
end
