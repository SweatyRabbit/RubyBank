# frozen_string_literal: true

RSpec.describe SendMoney do
  subject(:context) { described_class.call(sender_card:, recipient_card:, amount:) }

  describe '.call' do
    context 'when given valid params' do
      let(:sender_card) { create(:credit_card) }
      let(:recipient_card) { create(:credit_card) }
      let(:amount) { sender_card.balance }

      it 'succeeds' do
        expect(context).to be_a_success
      end
    end

    context 'when given invalid params' do
      let(:sender_card) { create(:credit_card) }
      let(:recipient_card) { create(:credit_card) }
      let(:amount) { sender_card.balance.next }

      it 'failure' do
        expect(context).to be_a_failure
      end

      it 'provides a failure message' do
        expect(context.error).to be_present
      end
    end
  end
end
