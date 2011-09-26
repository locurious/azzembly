class MakeLocationOwnableBySchool < ActiveRecord::Migration
  def up
    add_column :locations, :organization_type, :string
  end

  def down
    remove_column :locations, :organization_type
  end
end
