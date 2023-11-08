# frozen_string_literal: true

RSpec.describe Transaction do
  describe 'relations' do
    it { is_expected.to belong_to(:sender_card).class_name('CreditCard').inverse_of(:sent_transactions) }
    it { is_expected.to belong_to(:recipient_card).class_name('CreditCard').inverse_of(:received_transactions) }
  end

  describe 'validations' do
    context 'when amount is bigger than balance' do
      let(:sender_card) { create(:credit_card) }
      let(:recipient_card) { create(:credit_card) }
      let(:amount) { sender_card.balance.next }
      let(:invalid_transaction) { build(:transaction, sender_card:, recipient_card:, amount:) }

      before { invalid_transaction.valid? }

      it { expect(invalid_transaction.errors.full_messages).to contain_exactly(I18n.t('errors.bigger_than_balance')) }
    end
  end
end
