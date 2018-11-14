class AddLatLongtoProblems < ActiveRecord::Migration[5.2]
  def change
	  add_column :problems, :latitude, :float
	  add_column :problems, :longitude, :float
  end
end
