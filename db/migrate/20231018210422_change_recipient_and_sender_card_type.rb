# frozen_string_literal: true

class ChangeRecipientAndSenderCardType < ActiveRecord::Migration[7.1]
  def change
    remove_column :transactions, :sender_card, :string
    remove_column :transactions, :recipient_card, :string
    add_reference :transactions, :sender_card, foreign_key: { to_table: :credit_cards }
    add_reference :transactions, :recipient_card, foreign_key: { to_table: :credit_cards }
  end
end
