# frozen_string_literal: true

RSpec.describe Transaction do
  describe 'relations' do
    it { is_expected.to belong_to(:card) }
  end
end
