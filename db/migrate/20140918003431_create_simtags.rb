class CreateSimtags < ActiveRecord::Migration[5.2]
  def change
    create_table :simtags do |t|
		t.integer :simvol_id
		t.integer :tag_id

      t.timestamps
    end
  end
end
