# frozen_string_literal: true

RSpec.describe TransactionForm, type: :model do
  describe 'validations' do
    subject(:transaction_form) { described_class.new }

    it { is_expected.to validate_presence_of(:sender_card) }
    it { is_expected.to validate_presence_of(:recipient_card) }
    it { is_expected.to validate_presence_of(:amount) }

    it do
      expect(transaction_form).to validate_numericality_of(:amount).is_greater_than(0)
                                                                   .with_message(I18n.t('errors.invalid_amount'))
    end

    context 'when sender and recipient cards are the same' do
      let(:sender_card) { create(:credit_card) }
      let(:recipient_card) { sender_card }
      let(:amount) { sender_card.balance }

      before do
        transaction_form.sender_card = sender_card.number
        transaction_form.recipient_card = recipient_card.number
        transaction_form.amount = amount
        transaction_form.valid?
      end

      it 'has invalid transfer error message' do
        expect(transaction_form.errors.full_messages).to contain_exactly(I18n.t('errors.invalid_transfer'))
      end
    end
  end
end
