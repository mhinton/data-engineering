class Merchant < ActiveRecord::Base
  has_many :items, inverse_of: :merchant
  has_many :orders, inverse_of: :merchant
  validates :name, :address, presence: true
end
