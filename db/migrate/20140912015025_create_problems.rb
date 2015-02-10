class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :statement
      t.text :body
      t.datetime :published_at
      t.string :location
      t.integer :user_id

      t.timestamps
    end
  end
end

