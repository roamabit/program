class CreateSearchProblems < ActiveRecord::Migration
  def change
    create_table :search_problems do |t|
      t.integer :user_id
      t.string :keywords
      t.datetime :date_min
      t.datetime :date_max
      t.string :location
      t.integer :location_distance

      t.timestamps
    end
  end
end

