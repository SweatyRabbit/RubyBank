# frozen_string_literal: true

class CreateCard < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :number, null: false, index: { unique: true }
      t.string :expiration_date
      t.string :cvv
      t.float :balance
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
