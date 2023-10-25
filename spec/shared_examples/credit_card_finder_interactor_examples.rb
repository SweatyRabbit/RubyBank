# frozen_string_literal: true

RSpec.shared_examples 'a credit card finder interactor' do |interactor_class, card_type|
  subject(:context) { interactor_class.call(card_type => number) }

  describe '.call' do
    context 'when given valid params' do
      let(:number) { '1234 5678 9012 3456' }
      let!(:existing_card) { create(:credit_card, number:) }

      it 'succeeds' do
        expect(context).to be_a_success
      end

      it 'returns correct card' do
        expect(context[card_type]).to eq(existing_card)
      end
    end

    context 'when given invalid params' do
      let(:number) { '9999 9999 9999 9999' }

      it 'failure' do
        expect(context).to be_a_failure
      end

      it 'provides a failure message' do
        expect(context.error).to be_present
      end
    end
  end
end
