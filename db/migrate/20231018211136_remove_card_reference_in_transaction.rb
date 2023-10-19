# frozen_string_literal: true

class RemoveCardReferenceInTransaction < ActiveRecord::Migration[7.1]
  def change
    remove_reference :transactions, :card
  end
end
