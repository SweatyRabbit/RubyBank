# frozen_string_literal: true

class CreateCard < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :number, null: false
      t.float :balance, default: 0.0
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
