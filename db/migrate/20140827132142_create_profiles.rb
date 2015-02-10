class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|

      t.integer :user_id
      t.string :name
      t.text :bio
      t.datetime :made_public_at

      t.timestamps
    end
  end
end

# A table of all user entries by object? 
# Soo... Name: Bio. ... Name is the type Bio is the Content
# Can Group by Objects in simvols?