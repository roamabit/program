class AddLatLongToSearchProblems < ActiveRecord::Migration[5.2]
  def change
    add_column :search_problems, :latitude, :float
    add_column :search_problems, :longitude, :float
  end
end
