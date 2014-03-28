require 'spec_helper'

describe Customer do
  before :each do
    @customer = build_stubbed(:customer)
  end

  context "is valid" do
    it "with a name" do
      expect(@customer.name.blank?).to eq false
      expect(@customer.valid?).to eq true
    end
  end

  context "is invalid" do
    it "without a name" do
      @customer.name = nil
      expect(@customer.valid?).to eq false
    end
  end
end
