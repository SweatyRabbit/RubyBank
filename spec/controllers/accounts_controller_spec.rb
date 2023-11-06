# frozen_string_literal: true

RSpec.describe AccountsController do
  describe 'GET #show' do
    let(:user) { create(:user) }

    before do
      sign_in(user)
      get :show
    end

    context 'when redirect to this page' do
      it 'returns http success' do
        expect(response).to be_ok
      end

      it 'render account show template' do
        expect(response).to render_template(:show)
      end
    end
  end
end
