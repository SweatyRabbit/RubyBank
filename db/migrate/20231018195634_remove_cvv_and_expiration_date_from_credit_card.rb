# frozen_string_literal: true

class RemoveCvvAndExpirationDateFromCreditCard < ActiveRecord::Migration[7.1]
  def change
    remove_column :credit_cards, :cvv, :string
    remove_column :credit_cards, :expiration_date, :string
  end
end
