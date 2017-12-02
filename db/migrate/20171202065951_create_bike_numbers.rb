class CreateBikeNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :bike_numbers do |t|
    	t.integer :bike_id
    	t.string :number
    	t.integer :location_id
    	t.boolean :is_active
    	t.boolean :is_deleted					# Id deleted is true is_active must be false

      t.timestamps
    end
    add_index :bike_numbers, :bike_id, unique: false
  	add_index :bike_numbers, :number, unique: true
  end
end
