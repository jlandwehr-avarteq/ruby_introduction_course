class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :number
      t.string :street
      t.string :zip_code
      t.string :city
      t.string :country

      t.timestamps null: false
    end
  end
end
