# frozen_string_literal: true

FactoryBot.define do
  factory :flight do
    association :from_airport, factory: :airport
    association :to_airport, factory: :airport
    start_date { Faker::Time }
    duration { Faker::Number.number(6) }
  end
end
