class CreateSupporters < ActiveRecord::Migration
  def change
    create_table :supporters do |t|
      t.integer :user_id
      t.integer :problem_id
      t.text :role
      t.timestamps
    end
  end
end
