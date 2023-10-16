# frozen_string_literal: true

RSpec.describe 'Accounts', :request do
  describe 'GET /show/:id' do
    let(:user) { create(:user) }

    before do
      sign_in(user)
      get accounts_path(user)
    end

    it 'return http succes' do
      expect(response).to have_http_status(:success)
    end
  end
end
