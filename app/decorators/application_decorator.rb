class ApplicationDecorator < Draper::Decorator
  # Define methods for all decorated objects.
  # Helpers are accessed through `helpers` (aka `h`). For example:
  #
  #   def percent_amount
  #     h.number_to_percentage object.amount, precision: 2
  #   end
  def as_json(options = {})
    options[:only] ||=  attributes_for_output
    result = @model.as_json(options)
    # Add any virtual attributes specified
    options[:only].each do |attr|
      next unless self.respond_to?(attr)
      result.merge!({ attr => self.send(attr)})
    end
    (options[:only] - result.keys).each do |attr|
      raise "#{@model.class} ##{@model.id} has no attr called #{attr.inspect}" unless @model.respond_to?(attr)
      result.merge!({ attr => @model.send(attr)})
    end
    result
  end
end
