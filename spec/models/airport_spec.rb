# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Airport, type: :model do
  it 'has a valid factory' do
    expect(build(:airport)).to be_valid
  end
end
