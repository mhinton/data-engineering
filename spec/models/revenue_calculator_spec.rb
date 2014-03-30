require "spec_helper"

describe RevenueCalculator do
  context "#total_revenue" do
    before :each do
      data_file = build_stubbed(:data_file)
      merchant1 = build_stubbed(:merchant)
      merchant2 = build_stubbed(:merchant)
      item1 = build_stubbed(:item, price: 10.0, merchant: merchant1)
      item2 = build_stubbed(:item, price: 20.0, merchant: merchant1)
      item3 = build_stubbed(:item, price: 20.0, merchant: merchant2)
      @orders = [build_stubbed(:order, data_file: data_file, item: item1, quantity: 1),
                build_stubbed(:order, data_file: data_file, item: item2, quantity: 2),
                build_stubbed(:order, data_file: data_file, item: item3, quantity: 2),
                build_stubbed(:order, data_file: data_file, item: item1, quantity: 1)]
    end

    it "returns the total revenue of the orders" do
      expect(RevenueCalculator.total_revenue(@orders)).to eq BigDecimal.new(100.0, 5)
    end
  end
end
