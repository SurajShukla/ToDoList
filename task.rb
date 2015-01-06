class Task
  include DataMapper::Resource

  property :id, Serial
  property :done, Boolean
  property :description, String
  property :due_date, Date

  def to_s
    description.to_s
  end

  def due_date=(date)
    date = nil if date.to_s.empty?
    super date
  end

  def self.list_tasks(page, per)
    self.paginate(:page => page, :per_page => per || 3)
  end
end
