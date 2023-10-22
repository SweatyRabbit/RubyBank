# frozen_string_literal: true

RSpec.describe FindSenderCard do
  subject(:context) { described_class.call(sender_card: sender_card_number) }

  describe '.call' do
    context 'when given valid params' do
      let(:sender_card_number) { '1234 5678 9012 3456' }
      let!(:existing_sender_card) { create(:credit_card, number: sender_card_number) }

      it 'succeeds' do
        expect(context).to be_a_success
      end

      it 'returns correct card' do
        expect(context.sender_card).to eq(existing_sender_card)
      end
    end

    context 'when given invalid params' do
      let(:sender_card_number) { '9999 9999 9999 9999' }

      it 'failure' do
        expect(context).to be_a_failure
      end

      it 'provides a failure message' do
        expect(context.error).to be_present
      end
    end
  end
end
