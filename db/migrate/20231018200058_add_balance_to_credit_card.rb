# frozen_string_literal: true

class AddBalanceToCreditCard < ActiveRecord::Migration[7.1]
  def change
    add_column :credit_cards, :balance, :integer
  end
end
