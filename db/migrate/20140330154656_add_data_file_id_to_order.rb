class AddDataFileIdToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :data_file, null: false, default: 0, index: true
  end
end
