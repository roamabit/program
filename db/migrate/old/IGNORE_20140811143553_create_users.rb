class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
		t.string :password_salt
      t.timestamps
    end
  end
end
