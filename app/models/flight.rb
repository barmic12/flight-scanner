# frozen_string_literal: true

class Flight < ApplicationRecord
  enum airline: { ryanair: 'ryanair', wizzair: 'wizzair' }
  belongs_to :from_airport, class_name: 'Airport'
  belongs_to :to_airport, class_name: 'Airport'
end
