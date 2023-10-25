# frozen_string_literal: true

require_relative '../shared_examples/credit_card_finder_interactor_examples'

RSpec.describe FindRecipientCardInteractor do
  it_behaves_like 'a credit card finder interactor', described_class, :recipient_card
end
