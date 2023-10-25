# frozen_string_literal: true

require_relative '../shared_examples/credit_card_finder_interactor_examples'

RSpec.describe FindSenderCardInteractor do
  it_behaves_like 'a credit card finder interactor', described_class, :sender_card
end
