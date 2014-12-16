require './simple_store.rb'

class Task < SimpleStore
  attr_accessor :description

  def to_s
    description
  end
end
