class Location < ApplicationRecord
	validates_presence_of :name
	validates_presence_of :city_id
end
