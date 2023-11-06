# frozen_string_literal: true

RSpec.describe 'Show', :feature do
  let(:user) { create(:user) }

  before do
    sign_in(user)
    visit accounts_path(user)
  end

  describe 'displays welcome message for user' do
    it { expect(page).to have_content(I18n.t('account.welcome_message', email: user.email)) }
  end

  describe 'displays credit card dropdown' do
    it { expect(page).to have_select(:number) }
  end

  describe "displays #{I18n.t('buttons.view_details')} button" do
    it { expect(page).to have_button(I18n.t('buttons.view_details')) }
  end
end
