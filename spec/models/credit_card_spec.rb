# frozen_string_literal: true

RSpec.describe CreditCard do
  subject(:credit_card) { create(:credit_card) }

  describe 'relations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:sent_transactions).class_name('Transaction').with_foreign_key('sender_card_id') }

    it do
      expect(credit_card).to have_many(:received_transactions).class_name('Transaction')
                                                              .with_foreign_key('recipient_card_id')
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_uniqueness_of(:number).case_insensitive }
  end
end
