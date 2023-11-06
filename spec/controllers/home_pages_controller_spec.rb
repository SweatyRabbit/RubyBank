# frozen_string_literal: true

RSpec.describe HomePagesController do
  describe 'GET #home' do
    let(:user) { create(:user) }

    before do
      sign_in(user)
      get :home
    end

    context 'when redirect to this page' do
      it 'returns http success' do
        expect(response).to be_ok
      end

      it 'render home template' do
        expect(response).to render_template(:home)
      end
    end
  end
end
