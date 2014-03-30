require 'spec_helper'

describe Customer do
  it { should have_many(:orders) }
  it { should validate_presence_of(:name) }
end
