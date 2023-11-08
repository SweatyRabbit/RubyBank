# frozen_string_literal: true

class RemoveBalanceFromCard < ActiveRecord::Migration[7.0]
  def change
    remove_column :cards, :balance, :float
  end
end
