class List

  @@template = ERB.new(File.read('views/list.erb'), nil, '-')

  def initialize(tasks)
    @tasks = tasks
  end

  def to_markdown
    @@template.result(binding)
  end

  def self.compile_html_to_erb(opts = {})
    if !opts[:html].nil?
      @@template = ERB.new(opts[:html], nil, '-')
    elsif !opts[:filepath].nil?
      @@template = ERB.new(File.read(opts[:filepath]), nil, '-')
    else
      raise KeyError, "key not found: #{opts.keys}"
    end
  end
end
