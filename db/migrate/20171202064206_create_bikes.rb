class CreateBikes < ActiveRecord::Migration[5.1]
  def change
    create_table :bikes do |t|
    	t.string :name
    	# t.integer :bike_brand_id		# Use this only if bike_brand has many attributes, In this case only name.
    	t.string :bike_brand_name			# Should be tilized before inserting to model
    	# t.json :specs
    	t.float :price								# Price in INR
    	t.float :height								# Height in cm
    	t.float :weight								# Weight in kg
    	t.float :milage								# Milage in KmpL
    	t.float :tank_volume					# tank_volume in cc
    	t.string :slug
      t.timestamps
    end
    add_index :bikes, :bike_brand_name, unique: false
    add_index :bikes, :milage, unique: false
    add_index :bikes, :tank_volume, unique: false
    add_index :bikes, :slug, unique: true
  end
end
