# frozen_string_literal: true

RSpec.describe CheckDifferenceCard do
  subject(:context) { described_class.call(sender_card:, recipient_card:) }

  describe '.call' do
    context 'when given valid params' do
      let(:sender_card) { create(:credit_card).number }
      let(:recipient_card) { create(:credit_card).number }

      it 'succeeds' do
        expect(context).to be_a_success
      end
    end

    context 'when given invalid params' do
      let(:sender_card) { create(:credit_card).number }
      let(:recipient_card) { sender_card }

      it 'failure' do
        expect(context).to be_a_failure
      end

      it 'provides a failure message' do
        expect(context.error).to be_present
      end
    end
  end
end
