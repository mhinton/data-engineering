class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :item, index: true, null: false
      t.references :customer, index: true, null: false
      t.integer :quantity, null: false
      t.timestamps
    end
  end
end
