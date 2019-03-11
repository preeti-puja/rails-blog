class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :description
      t.decimal :price, null: false
      t.integer :quantity, null: false, default: 0
      t.string :sku, null: false, index: {unique: true}

      t.timestamps
    end
  end
end
