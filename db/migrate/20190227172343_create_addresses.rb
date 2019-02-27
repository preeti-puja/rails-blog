class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street1, null: false
      t.string :street2
      t.string :city, null: false
      t.string :country, null: false
      t.integer :pin_code, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
