# frozen_string_literal: true

FactoryBot.define do
  factory :trip do
    flight
    seats { rand(1..2) }
  end
end
