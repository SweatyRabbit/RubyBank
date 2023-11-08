# frozen_string_literal: true

class CreateTransaction < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :sender_card
      t.string :recipient_card
      t.integer :amount
      t.belongs_to :card, null: false

      t.timestamps
    end
  end
end
