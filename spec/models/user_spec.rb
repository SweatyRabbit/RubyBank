# frozen_string_literal: true

RSpec.describe User do
  describe 'relations' do
    it { is_expected.to have_many(:credit_cards).dependent(:destroy) }
    it { is_expected.to have_many(:sent_transactions).through(:credit_cards).source(:sent_transactions) }
    it { is_expected.to have_many(:received_transactions).through(:credit_cards).source(:received_transactions) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
  end
end
