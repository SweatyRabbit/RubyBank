# frozen_string_literal: true

RSpec.describe FindRecipientCard do
  subject(:context) { described_class.call(recipient_card: recipient_card_number) }

  describe '.call' do
    context 'when given valid params' do
      let(:recipient_card_number) { '1234 5678 9012 3456' }
      let!(:existing_recipient_card) { create(:credit_card, number: recipient_card_number) }

      it 'succeeds' do
        expect(context).to be_a_success
      end

      it 'returns correct card' do
        expect(context.recipient_card).to eq(existing_recipient_card)
      end
    end

    context 'when given invalid params' do
      let(:recipient_card_number) { '9999 9999 9999 9999' }

      it 'failure' do
        expect(context).to be_a_failure
      end

      it 'provides a failure message' do
        expect(context.error).to be_present
      end
    end
  end
end
