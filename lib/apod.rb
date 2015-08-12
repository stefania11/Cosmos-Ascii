# Convert Json object into an instance of a class
class APOD
  def initialize(data)
    data.each do |k, v|
      instance_variable_set("@#{k}", v)

      reader = proc { instance_variable_get("@#{k}") }
      self.class.send('define_method', k, reader)

      getter = proc { |other| instance_variable_set("@#{k}", other) }
      self.class.send('define_method', "#{k}=", getter)
    end
  end
end
