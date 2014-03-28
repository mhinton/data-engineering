class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :merchant, index: true, null: false
      t.text :description, null: false
      t.decimal :price, precision: 5, scale: 2, null: false
      t.timestamps
    end
  end
end
