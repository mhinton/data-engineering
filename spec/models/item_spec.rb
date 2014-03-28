require 'spec_helper'

describe Item do
  subject { build_stubbed(:item) }
  it { should validate_presence_of(:merchant_id) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
  it { should validate_numericality_of(:price).is_greater_than(0.0) }
end
