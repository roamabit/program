class CreateSimvols < ActiveRecord::Migration[5.2]
  def change
    create_table :simvols do |t|
		
		t.string :name

      t.timestamps
    end
  end
end
