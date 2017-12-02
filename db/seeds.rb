# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
City.delete_all
City.create({name: "Bengaluru"})
City.create({name: "Hyderabad"})
# City.create({name: "Bengaluru"})
# City.create({name: "Bengaluru"})
Location.delete_all
Location.create({name: "Koramangala", city_id: 1})
Location.create({name: "Indiranagar", city_id: 1})
Location.create({name: "BTM Layout", city_id: 1})
Location.create({name: "HSR Layout", city_id: 1})

Location.create({name: "Madhapur", city_id: 2})
Location.create({name: "Manikonda", city_id: 2})
Location.create({name: "Mehdipatnam", city_id: 2})
Location.create({name: "Uppal", city_id: 2})
User.delete_all
User.create({first_name: "Sai", uid: "saichander@gmail.com", provider: "email", email: "saichander@gmail.com"})
User.create({first_name: "Sai1", uid: "saichander1@gmail.com", provider: "email", email: "saichander1@gmail.com"})

Bike.delete_all
Bike.create({name: "Royal Enfield Classic", bike_brand_name: "Roayl Enfield",price: 150000, height: 100, weight: 160, milage: 20, tank_volume: 180})
Bike.create({name: "Royal Enfield ThunderBird", bike_brand_name: "Roayl Enfield",price: 150000, height: 100, weight: 160, milage: 20, tank_volume: 220})
Bike.create({name: "Bajaj Pulsar 150", bike_brand_name: "Bajaj",price: 120000, height: 100, weight: 160, milage: 20, tank_volume: 150})
Bike.create({name: "Yamaha FZ", bike_brand_name: "Yamaha",price: 90000, height: 100, weight: 160, milage: 20, tank_volume: 150})
Bike.create({name: "Bajaj Pulsar 120", bike_brand_name: "Bajaj",price: 80000, height: 100, weight: 160, milage: 20, tank_volume: 120})
Bike.create({name: "Bajaj Pulsar 200", bike_brand_name: "Bajaj",price: 180000, height: 100, weight: 160, milage: 20, tank_volume: 220})
# Bike.create({name: "Royal Enfield Classic", bike_brand_name: "Roayl Enfield",price: 150000, height: 100, weight: 160, milage: 20, tank_volume: 150})
# Bike.create({name: "Royal Enfield Classic", bike_brand_name: "Roayl Enfield",price: 150000, height: 100, weight: 160, milage: 20, tank_volume: 150})
BikeNumber.delete_all
BikeNumber.create({bike_id: 1,number: "AP 12312",location_id: 1})
BikeNumber.create({bike_id: 1,number: "AP 12313",location_id: 2})
BikeNumber.create({bike_id: 1,number: "AP 12314",location_id: 3})
BikeNumber.create({bike_id: 1,number: "AP 12315",location_id: 4})
BikeNumber.create({bike_id: 1,number: "AP 12316",location_id: 5})
BikeNumber.create({bike_id: 1,number: "AP 12317",location_id: 6})
BikeNumber.create({bike_id: 1,number: "AP 12318",location_id: 7})
BikeNumber.create({bike_id: 1,number: "AP 12319",location_id: 8})

BikeNumber.create({bike_id: 2,number: "AP 12310",location_id: 1})
BikeNumber.create({bike_id: 2,number: "AP 12311",location_id: 2})
BikeNumber.create({bike_id: 2,number: "AP 12320",location_id: 3})
BikeNumber.create({bike_id: 2,number: "AP 12321",location_id: 4})
BikeNumber.create({bike_id: 2,number: "AP 12322",location_id: 5})
BikeNumber.create({bike_id: 2,number: "AP 12323",location_id: 6})
BikeNumber.create({bike_id: 2,number: "AP 12324",location_id: 7})
BikeNumber.create({bike_id: 2,number: "AP 12325",location_id: 8})



BikeNumber.create({bike_id: 3,number: "AP 12326",location_id: 1})
BikeNumber.create({bike_id: 3,number: "AP 12327",location_id: 2})
BikeNumber.create({bike_id: 3,number: "AP 12328",location_id: 3})
BikeNumber.create({bike_id: 3,number: "AP 12329",location_id: 4})
BikeNumber.create({bike_id: 3,number: "AP 12330",location_id: 5})
BikeNumber.create({bike_id: 3,number: "AP 12331",location_id: 6})
BikeNumber.create({bike_id: 3,number: "AP 12332",location_id: 7})
BikeNumber.create({bike_id: 3,number: "AP 12333",location_id: 8})



BikeNumber.create({bike_id: 4,number: "AP 12334",location_id: 1})
BikeNumber.create({bike_id: 4,number: "AP 12335",location_id: 2})
BikeNumber.create({bike_id: 4,number: "AP 12336",location_id: 3})
BikeNumber.create({bike_id: 4,number: "AP 12337",location_id: 4})
BikeNumber.create({bike_id: 4,number: "AP 12338",location_id: 5})
BikeNumber.create({bike_id: 4,number: "AP 12339",location_id: 6})
BikeNumber.create({bike_id: 4,number: "AP 12340",location_id: 7})
BikeNumber.create({bike_id: 4,number: "AP 12341",location_id: 8})

BikeNumber.create({bike_id: 5,number: "AP 12342",location_id: 1})
BikeNumber.create({bike_id: 5,number: "AP 12343",location_id: 2})
BikeNumber.create({bike_id: 5,number: "AP 12344",location_id: 3})
BikeNumber.create({bike_id: 5,number: "AP 12345",location_id: 4})
BikeNumber.create({bike_id: 5,number: "AP 12346",location_id: 5})
BikeNumber.create({bike_id: 5,number: "AP 12347",location_id: 6})
BikeNumber.create({bike_id: 5,number: "AP 12348",location_id: 7})
BikeNumber.create({bike_id: 5,number: "AP 12349",location_id: 8})

BikeNumber.create({bike_id: 6,number: "AP 12350",location_id: 1})
BikeNumber.create({bike_id: 6,number: "AP 12351",location_id: 2})
BikeNumber.create({bike_id: 6,number: "AP 12352",location_id: 3})
BikeNumber.create({bike_id: 6,number: "AP 12353",location_id: 4})
BikeNumber.create({bike_id: 6,number: "AP 12354",location_id: 5})
BikeNumber.create({bike_id: 6,number: "AP 12355",location_id: 6})
BikeNumber.create({bike_id: 6,number: "AP 12356",location_id: 7})
BikeNumber.create({bike_id: 6,number: "AP 12357",location_id: 8})

