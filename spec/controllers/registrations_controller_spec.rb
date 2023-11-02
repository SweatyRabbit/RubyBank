# frozen_string_literal: true

RSpec.describe RegistrationsController, :controller do
  describe 'POST #create' do
    let(:user_attributes) { attributes_for(:user) }

    before do
      request.env['devise.mapping'] = Devise.mappings[:user]
      post :create, params: { user: user_attributes }
    end

    it 'creates user' do
      expect(User.count).to eq(1)
    end

    it 'creates credit card' do
      expect(CreditCard.count).to eq(1)
    end

    it 'creates users with credit card' do
      expect(User.first.credit_cards.first).to eq(CreditCard.first)
    end
  end
end
