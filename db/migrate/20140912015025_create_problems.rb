class CreateProblems < ActiveRecord::Migration[5.2]
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

