# frozen_string_literal: true

FactoryBot.define do
  factory :airport do
    icao { 'MyString' }
    iata { 'MyString' }
    name { 'MyString' }
    city { 'MyString' }
    state { 'MyString' }
    country { 'MyString' }
    elevation { 1 }
    lat { '9.99' }
    lng { '9.99' }
    tz { 'MyString' }
  end
end
