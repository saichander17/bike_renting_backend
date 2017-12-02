class BikeDecorator < Draper::Decorator
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  decorates :bike

  def initialize(bike)
    @model = bike
  end
  protected

  def attributes_for_output
    %w(id name price height weight milage tank_volume)
  end

end