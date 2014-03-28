require 'spec_helper'

describe Merchant do
  before :each do
    @merchant = build_stubbed(:merchant)
  end

  context "is valid" do
    it "with a name" do
      expect(@merchant.name.blank?).to eq false
      expect(@merchant.valid?).to eq true
    end
    it "with a street address" do
      expect(@merchant.address.blank?).to eq false
      expect(@merchant.valid?).to eq true
    end
  end

  context "is invalid" do
    it "without a name" do
      @merchant.name = nil
      expect(@merchant.valid?).to eq false
    end
    it "without a street address" do
      @merchant.address = nil
      expect(@merchant.valid?).to eq false
    end
  end
end
