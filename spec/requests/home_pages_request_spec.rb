# frozen_string_literal: true

RSpec.describe 'HomePages', :request do
  describe 'GET /' do
    let(:user) { create(:user) }

    before do
      sign_in(user)
      get root_path
    end

    it 'return http succes' do
      expect(response).to have_http_status(:success)
    end
  end
end
