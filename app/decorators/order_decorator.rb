class OrderDecorator < Draper::Decorator
  decorates :bike

  def initialize(order)
    @model = order
  end

  def bike
  	Bike.find_by(id: @model.bike_id).name rescue nil
  end

  def address
  	@model.pick_up_address
  end

  def location
  	Location.find_by(id: @model.location_id).name rescue nil
  end
  protected

  def attributes_for_output
    %w(id start_time end_time bike address location)
  end
end
