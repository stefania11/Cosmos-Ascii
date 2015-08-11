# Convert Json object into an instance of a class
class Apod
  def initialize(data)
    data.each do |k, v|
      binding.pry
      instance_variable_set("@#{k}", v)

      define_method k do
        instance_variable_get("@#{k}")
      end

      define_method "#{k}=" do |other|
        instance_variable_set("@#{k}", other)
      end
    end
  end
end
