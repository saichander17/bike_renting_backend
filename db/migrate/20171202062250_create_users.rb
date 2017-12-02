class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :uid
    	t.string :provider
    	t.string :email
    	t.string :mobile
      t.timestamps
    end
    add_index :users, :email,                	unique: true
    add_index :users, :mobile,               	unique: true
    add_index :users, [:uid,:provider], 			unique: true
  end
end
