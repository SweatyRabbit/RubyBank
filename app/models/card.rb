# frozen_string_literal: true

class Card < ApplicationRecord
  validates :number, presence: true, uniqueness: true
  validates :balance, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user
end
