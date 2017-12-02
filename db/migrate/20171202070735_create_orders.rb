class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
    	t.integer :user_id, :null => false
    	t.datetime :start_time
    	t.datetime :end_time
    	t.integer :bike_id
    	t.integer :bike_number_id
    	t.text :pick_up_address
    	t.integer :location_id
      t.timestamps
    end
    add_index :orders, :user_id, unique: false
    add_index :orders, :start_time, unique: false
    add_index :orders, :end_time, unique: false
  end
end
