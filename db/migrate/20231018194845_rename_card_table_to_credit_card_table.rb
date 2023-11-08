# frozen_string_literal: true

class RenameCardTableToCreditCardTable < ActiveRecord::Migration[7.1]
  def change
    rename_table :cards, :credit_cards
  end
end
