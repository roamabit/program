class CreateSupporters < ActiveRecord::Migration[5.2]
  def change
    create_table :supporters do |t|
      t.integer :user_id
      t.integer :problem_id
      t.text :role
      t.timestamps
    end
  end
end
