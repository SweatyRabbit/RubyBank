# frozen_string_literal: true

class TransferMoney
  include Interactor::Organizer

  organize FindSenderCard, FindRecipientCard, CheckDifferenceCard, SendMoney
end
