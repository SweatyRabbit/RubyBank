# frozen_string_literal: true

RSpec.describe FindRecipientCardInteractor do
  it_behaves_like 'a credit card finder interactor', described_class, :recipient_card
end
