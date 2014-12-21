class List
  TEMPLATE = ERB.new(File.read('views/list.erb'), nil, '-')

  def initialize(tasks)
    @tasks = tasks
  end

  def to_markdown
    TEMPLATE.result(binding)
  end
end
