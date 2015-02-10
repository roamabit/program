class AddProfileableToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :profileable_id, :integer
    add_column :profiles, :profileable_type, :string
  end
end
