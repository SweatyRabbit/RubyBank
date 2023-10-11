# frozen_string_literal: true

RSpec.describe Card do
  describe 'relations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_numericality_of(:balance).is_greater_than_or_equal_to(Card::MIN_VALUE) }
  end
end
