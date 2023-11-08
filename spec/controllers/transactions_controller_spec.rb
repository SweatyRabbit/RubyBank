# frozen_string_literal: true

RSpec.describe TransactionsController do
  describe 'POST #create' do
    let(:user) { create(:user) }
    let!(:recipient_user) { create(:user) }
    let!(:sender_card) { create(:credit_card, user:) }
    let!(:recipient_card) { create(:credit_card, user: recipient_user) }

    before do
      sign_in(user)
    end

    context 'when user signed in and make correct transaction' do
      let(:amount) { sender_card.balance / 100.0  }

      it 'returns change in transaction' do
        expect do
          post :create, params: { sender_card: sender_card.number,
                                  recipient_card: recipient_card.number,
                                  amount: }
        end.to change(Transaction, :count).from(0).to(1)
      end
    end

    context 'when user signed in and make wrong transaction' do
      let(:wrong_amount) { sender_card.balance.next / 100.0 }

      it 'return zero changes in transaction' do
        expect do
          post :create, params: { sender_card: sender_card.number,
                                  recipient_card: recipient_card.number,
                                  amount: wrong_amount }
        end.not_to change(Transaction, :count)
      end
    end
  end
end
