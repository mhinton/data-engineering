class Item < ActiveRecord::Base
  belongs_to :merchant
  validates :merchant_id, :description, :price, presence: true
  validates :price, :numericality => {greater_than: 0.0}
end
