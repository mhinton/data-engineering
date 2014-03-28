require 'spec_helper'

describe Order do
  subject { build_stubbed(:order) }
  it { should validate_presence_of(:item_id) }
  it { should validate_presence_of(:customer_id) }
  it { should validate_presence_of(:quantity) }
  it { should validate_numericality_of(:quantity).is_greater_than(0) }
end
