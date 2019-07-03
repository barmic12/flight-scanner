# frozen_string_literal: true

class Trip < ApplicationRecord
  belongs_to :flight
end
