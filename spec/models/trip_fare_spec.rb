# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TripFare, type: :model do
  it 'has a valid factory' do
    expect(build(:trip_fare)).to be_valid
  end
end
