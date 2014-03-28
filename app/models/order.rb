class Order < ActiveRecord::Base
  belongs_to :item
  belongs_to :customer
  validates :item_id, :customer_id, :quantity, presence: true
  validates :quantity, :numericality => {greater_than: 0}
end
