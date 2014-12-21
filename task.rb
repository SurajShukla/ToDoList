class Task
  include DataMapper::Resource

  property :id, Serial
  property :done, Boolean
  property :description, String

  def to_s
    description.to_s
  end
end
