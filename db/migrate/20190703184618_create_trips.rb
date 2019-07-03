# frozen_string_literal: true

class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.references :flight, foreign_key: true
      t.integer :seats

      t.timestamps
    end
  end
end
