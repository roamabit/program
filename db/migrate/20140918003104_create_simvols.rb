class CreateSimvols < ActiveRecord::Migration
  def change
    create_table :simvols do |t|
		
		t.string :name

      t.timestamps
    end
  end
end
