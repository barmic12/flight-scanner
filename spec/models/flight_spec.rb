# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Flight, type: :model do
  it 'has a valid factory' do
    expect(build(:flight)).to be_valid
  end
end
