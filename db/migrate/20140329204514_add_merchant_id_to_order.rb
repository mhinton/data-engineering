class AddMerchantIdToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :merchant, null: false, default: 0, index: true
  end
end
