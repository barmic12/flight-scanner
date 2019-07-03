require 'rails_helper'

RSpec.describe TripFollow, type: :model do
  it 'has a valid factory' do
    expect(build(:trip_follow)).to be_valid
  end
end
