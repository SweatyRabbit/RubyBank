# frozen_string_literal: true

class Card < ApplicationRecord
  MIN_VALUE = 0.0

  validates :number, presence: true, uniqueness: true
  validates :balance, numericality: { greater_than_or_equal_to: MIN_VALUE }

  belongs_to :user
end
