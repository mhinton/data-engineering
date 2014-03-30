require 'spec_helper'

describe Merchant do
  it { should have_many(:orders) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
end
