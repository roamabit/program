class AddLatLongToSearchProblems < ActiveRecord::Migration
  def change
    add_column :search_problems, :latitude, :float
    add_column :search_problems, :longitude, :float
  end
end
