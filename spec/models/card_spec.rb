# frozen_string_literal: true

RSpec.describe Card do
  describe 'relations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:transactions).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:number) }
  end
end
