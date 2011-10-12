class PolymorphizeUserOrganization < ActiveRecord::Migration
  def up
    add_column :users, :organization_type, :string
  end

  def down
    remove_column :locations, :organization_type
  end
end
