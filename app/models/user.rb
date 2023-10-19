# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :email, presence: true

  has_many :credit_cards, dependent: :destroy
  has_many :sent_transactions, through: :credit_cards, source: :sent_transactions
  has_many :received_transactions, through: :credit_cards, source: :received_transactions
end
