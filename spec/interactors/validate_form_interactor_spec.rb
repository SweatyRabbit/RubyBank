# frozen_string_literal: true

RSpec.describe ValidateFormInteractor do
  subject(:context) do
    described_class.call(amount:, sender_card:, recipient_card:)
  end

  describe '.call' do
    context 'when given valid params' do
      let(:amount) { 1.2 }
      let(:sender_card) { create(:credit_card).number }
      let(:recipient_card) { create(:credit_card).number }

      it 'succeeds' do
        expect(context).to be_a_success
      end

      it 'returns correct amount' do
        expect(context.amount).to eq(amount * 100)
      end
    end

    context 'when given invalid params' do
      let(:amount) { 'asd' }
      let(:sender_card) { '' }
      let(:recipient_card) { '' }

      it 'fails' do
        expect(context).to be_a_failure
      end

      it 'provides a failure message' do
        expect(context.error).to be_present
      end
    end
  end
end
