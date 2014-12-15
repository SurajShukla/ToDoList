class Task
  attr_accessor :description

  def initialize(attributes = {})
    @description = attributes[:description]
  end

  def to_s
    description
  end
end
