class Order < ActiveRecord::Base
  belongs_to :data_file, inverse_of: :orders
  belongs_to :item, inverse_of: :orders
  belongs_to :customer, inverse_of: :orders
  belongs_to :merchant, inverse_of: :orders
  validates :item_id, :customer_id, :merchant_id, :quantity, presence: true
  validates :quantity, :numericality => {greater_than: 0}
end
