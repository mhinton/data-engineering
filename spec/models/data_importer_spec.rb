require 'spec_helper'

# Test File Data in spec/support/fixtures/example_input.tab
# purchaser name	item description	item price	purchase count	merchant address	merchant name
# Snake Plissken	$10 off $20 of food	10.0	2	987 Fake St	Bob's Pizza
# Amy Pond	$30 of awesome for $10	10.0	5	456 Unreal Rd	Tom's Awesome Shop
# Marty McFly	$20 Sneakers for $5	5.0	1	123 Fake St	Sneaker Store Emporium
# Snake Plissken	$20 Sneakers for $5	5.0	4	123 Fake St	Sneaker Store Emporium

describe DataImporter do
  before :each do
    @data_file = build_stubbed(:data_file)
    @test_file_path = "#{Rails.root}/spec/support/fixtures/example_input.tab"
    @data_file.stub_chain(:upload, :path).and_return(@test_file_path)

    @bad_data_file = build_stubbed(:data_file)
    @test_bad_file_path = "#{Rails.root}/spec/support/fixtures/example_bad_input.tab"
    @bad_data_file.stub_chain(:upload, :path).and_return(@test_bad_file_path)
  end

  it "raises ImportError when file path is nil" do
    @bad_data_file.stub_chain(:upload, :path).and_return(nil)
    expect {
      @data_importer = DataImporter.new(@bad_data_file)
    }.to raise_error(ImportError)
  end

  it "raises ImportError when import file contains and empty line" do
    expect {
      @data_importer = DataImporter.new(@bad_data_file)
      @data_importer.process
    }.to raise_error(ImportError)
  end

  it "creates 3 customers from input file" do
    @data_importer = DataImporter.new(@data_file)
    @data_importer.process
    expect(Customer.count).to eq 3
  end

  it "creates 3 merchants from input file" do
    @data_importer = DataImporter.new(@data_file)
    @data_importer.process
    expect(Merchant.count).to eq 3
  end

  it "creates 3 items from input file" do
    @data_importer = DataImporter.new(@data_file)
    @data_importer.process
    expect(Item.count).to eq 3
  end

  it "creates 3 orders from input file" do
    @data_importer = DataImporter.new(@data_file)
    @data_importer.process
    expect(Order.count).to eq 4
  end
end
