class Item < ActiveRecord::Base
  belongs_to :merchant, inverse_of: :items
  has_many :orders, inverse_of: :item
  validates :merchant_id, :description, :price, presence: true
  validates :price, :numericality => {greater_than: 0.0}
end
