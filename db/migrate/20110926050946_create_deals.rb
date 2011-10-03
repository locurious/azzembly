class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :name
      t.text :description
      t.string :deal_type
      t.datetime :start_date
      t.datetime :end_date
      t.integer :business_id

      t.timestamps
    end

    create_table :deal_school_eligibilities, :id => false do |t|
      t.references :school
      t.references :deal
    end

    add_index :deals, :business_id
    add_index :deal_school_eligibilities, [:deal_id, :school_id]

  end
end
