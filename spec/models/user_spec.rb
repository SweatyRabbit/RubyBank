# frozen_string_literal: true

RSpec.describe User do
  describe 'relations' do
    it { is_expected.to have_many(:cards).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
  end
end
