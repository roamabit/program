class CreateSolutions < ActiveRecord::Migration[5.2]
  def change
    create_table :solutions do |t|
      t.integer :problem_id
      t.integer :project_id
      t.text :solution_abstract
      t.datetime :published_at

      t.timestamps
    end
  end
end
