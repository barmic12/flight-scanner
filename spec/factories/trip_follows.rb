# frozen_string_literal: true

FactoryBot.define do
  factory :trip_follow do
    trip
    user
  end
end
