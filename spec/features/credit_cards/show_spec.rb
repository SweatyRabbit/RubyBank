# frozen_string_literal: true

RSpec.describe 'Show', :feature do
  let(:user) { create(:user) }
  let!(:credit_card) { create(:credit_card, user:) }

  before do
    sign_in(user)
    visit credit_cards_path(number: credit_card.number)
  end

  describe 'credit card info' do
    let(:expected_balance) { credit_card.balance / 100 }

    it 'displays credit card number' do
      expect(page).to have_content(credit_card.number)
    end

    it 'displays credit card balance' do
      expect(page).to have_content(expected_balance)
    end
  end

  describe 'transactions info' do
    context 'when user don`t have any transactions' do
      it { expect(page).to have_content(I18n.t('transaction.no_transactions')) }
    end
  end
end
