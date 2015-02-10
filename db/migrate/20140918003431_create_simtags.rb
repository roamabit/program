class CreateSimtags < ActiveRecord::Migration
  def change
    create_table :simtags do |t|
		t.integer :simvol_id
		t.integer :tag_id

      t.timestamps
    end
  end
end
