# frozen_string_literal: true

RSpec.describe Transaction do
  describe 'relations' do
    it { is_expected.to belong_to(:card) }
  end

  describe 'validations' do
    let(:wrong_input) { 'asd' }
    let(:card) { create(:card) }

    before { create(:transaction, card:, amount: wrong_input) }

    it { is_expected.not_to allow_value(wrong_input).for(:amount) }
  end
end
