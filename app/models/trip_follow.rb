# frozen_string_literal: true

class TripFollow < ApplicationRecord
  belongs_to :trip
  belongs_to :user
end
