# frozen_string_literal: true

class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.references :from_airport, foreign_key: { to_table: :airports }
      t.references :to_airport, foreign_key: { to_table: :airports }
      t.datetime :start_date
      t.integer :duration

      t.timestamps
    end
  end
end
