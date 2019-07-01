# frozen_string_literal: true

class CreateAirports < ActiveRecord::Migration[5.2]
  def change
    create_table :airports do |t|
      t.string :icao, limit: 4
      t.string :iata, limit: 3
      t.string :name
      t.string :city
      t.string :state
      t.string :country
      t.integer :elevation
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6
      t.string :tz

      t.timestamps
    end
  end
end
