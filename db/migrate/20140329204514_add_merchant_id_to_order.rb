class AddMerchantIdToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :merchant, index: true
  end
end
