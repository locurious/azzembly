class CreateDeals < ActiveRecord::Migration
  def self.up

    create_table :deals do |t|
      t.string :name
      t.text   :description
      t.references :business
    end

    create_table :deal_school_eligibility, :id => false do |t|
      t.references :school
      t.references :deal
    end

    add_index :deals, :business_id
    add_index :deal_school_eligibility, [:deal_id, :school_id]

  end

  def self.down
    drop_table :deals
    drop_table :deal_school_eligibility
  end
end
