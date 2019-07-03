# frozen_string_literal: true

FactoryBot.define do
  factory :trip_fare do
    trip
    price { Faker::Number.number(4) }
    currency { Faker::Currency.code }
  end
end
