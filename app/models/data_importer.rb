require 'csv'

# throw this error whenever we run into an issue with the uploaded data file
class ImportError < StandardError; end

class DataImporter
  attr_reader :data_file

  def initialize(data_file)
    raise ImportError, "Path to file is nil" if data_file.upload.path.nil?
    @data_file = data_file
  end

  def process
    ActiveRecord::Base.transaction do
      CSV.foreach(@data_file.upload.path, col_sep: "\t", headers: true, return_headers: false) do |row|
        raise ImportError, "File row is empty: #{row.inspect}" if row.empty?

        customer = Customer.find_or_create_by(name: row["purchaser name"])
        merchant = Merchant.find_or_create_by(name: row["merchant name"], address: row["merchant address"])
        item = Item.find_or_create_by(merchant: merchant, description: row["item description"], price: row["item price"])
        order = Order.create(data_file: @data_file, customer: customer, merchant: merchant, item: item, quantity: row["purchase count"])
      end
    end
  end
end
