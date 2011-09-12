class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :region
      t.string :postal_code
      t.string :phone
      t.string :fax
      t.float :lat
      t.float :lng
      t.integer :organization_id

      t.timestamps
    end
  end
end
