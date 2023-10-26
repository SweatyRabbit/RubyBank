# frozen_string_literal: true

RSpec.describe FindSenderCardInteractor do
  it_behaves_like 'a credit card finder interactor', described_class, :sender_card
end
