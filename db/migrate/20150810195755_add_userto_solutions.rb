class AddUsertoSolutions < ActiveRecord::Migration[5.2]
  def change
        add_column :solutions, :user_id, :integer
  end
end
