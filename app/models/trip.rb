# frozen_string_literal: true

class Trip < ApplicationRecord
  belongs_to :flight

  has_many :trip_follows
  has_many :users, through: :trip_follows
  has_many :trip_fares
end
