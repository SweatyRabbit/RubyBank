# frozen_string_literal: true

RSpec.describe 'Home', :feature do
  let(:user) { create(:user) }
  let!(:sender_card) { create(:credit_card, user:) }
  let!(:recipient_card) { create(:credit_card) }
  let(:amount) { 100 }

  describe 'transfer money' do
    context 'with valid params' do
      before do
        sign_in(user)
        visit root_path
        select(sender_card.number, from: :sender_card)
        fill_in(:recipient_card, with: recipient_card.number)
        fill_in(:amount, with: amount)
        click_button(I18n.t('buttons.transfer_money'))
      end

      it 'has succesfull message' do
        expect(page).to have_content(I18n.t('successful_transaction'))
      end
    end

    context 'when trying to send money to the same card' do
      before do
        sign_in(user)
        visit root_path
        select(sender_card.number, from: :sender_card)
        fill_in(:recipient_card, with: sender_card.number)
        fill_in(:amount, with: amount)
        click_button(I18n.t('buttons.transfer_money'))
      end

      it 'has ivanlid transafer error message' do
        expect(page).to have_content(I18n.t('errors.invalid_transfer'))
      end
    end

    context 'when trying to pass invalid amount' do
      let(:invalid_amount) { 'asd' }

      before do
        sign_in(user)
        visit root_path
        select(sender_card.number, from: :sender_card)
        fill_in(:recipient_card, with: recipient_card.number)
        fill_in(:amount, with: invalid_amount)
        click_button(I18n.t('buttons.transfer_money'))
      end

      it 'has inavlid amount type error message' do
        expect(page).to have_content(I18n.t('errors.invalid_amount'))
      end
    end

    context 'when trying to pass bigger amount than card balance' do
      before do
        sign_in(user)
        visit root_path
        select(sender_card.number, from: :sender_card)
        fill_in(:recipient_card, with: recipient_card.number)
        fill_in(:amount, with: sender_card.balance.next)
        click_button(I18n.t('buttons.transfer_money'))
      end

      it 'has inavlid amount type error message' do
        expect(page).to have_content(I18n.t('errors.bigger_than_balance'))
      end
    end

    context 'when trying to pass negative amount' do
      let(:invalid_amount) { -1 }

      before do
        sign_in(user)
        visit root_path
        select(sender_card.number, from: :sender_card)
        fill_in(:recipient_card, with: recipient_card.number)
        fill_in(:amount, with: invalid_amount)
        click_button(I18n.t('buttons.transfer_money'))
      end

      it 'has inavlid amount type error message' do
        expect(page).to have_content(I18n.t('errors.invalid_amount'))
      end
    end
  end
end
