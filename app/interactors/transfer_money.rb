# frozen_string_literal: true

class TransferMoney
  include Interactor::Organizer

  organize ValidateForm, FindSenderCard, FindRecipientCard, CheckDifferenceCard, SendMoney
end
