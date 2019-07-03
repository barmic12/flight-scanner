# frozen_string_literal: true

class CreateTripFares < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_fares do |t|
      t.references :trip, foreign_key: true
      t.integer :price
      t.string :currency, limit: 3

      t.timestamps
    end
  end
end
