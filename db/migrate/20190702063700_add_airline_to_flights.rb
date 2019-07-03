# frozen_string_literal: true

class AddAirlineToFlights < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TYPE flight_airline AS ENUM ('ryanair', 'wizzair');
    SQL
    add_column :flights, :airline, :flight_airline
    add_index :flights, :airline
  end

  def down
    remove_column :flights, :airline
    execute <<-SQL
      DROP TYPE flight_airline;
    SQL
  end
end
